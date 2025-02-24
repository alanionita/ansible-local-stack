!/bin/bash
set -euo pipefail

LOG_FILE="make-benchmarks.md"
TIMESTAMP_FORMAT="+%Y-%m-%d %H:%M:%S"

# Initialize markdown file
if [ ! -f "$LOG_FILE" ]; then
    echo -e "# Make Command Benchmarks\n" > "$LOG_FILE"
    echo "| Command | Date | Real (s) | User (s) | Sys (s) |" >> "$LOG_FILE"
    echo "|---------|------|----------|----------|---------|" >> "$LOG_FILE"
fi

benchmark() {
    local command="$1"
    local temp_file=$(mktemp)
    
    echo -n "Benchmarking 'make $command'..."
    
    # Use /usr/bin/time to measure execution time
    { /usr/bin/time -f "%e %U %S" -o "$temp_file" make "$command" > make-output.log 2>&1; } || {
        echo "Failed to run 'make $command'. Check make-output.log for details."
        rm "$temp_file"
        exit 1
    }

    # Read timing results
    read real_time user_time sys_time < "$temp_file"
    rm "$temp_file"

    # Append to markdown file
    printf "| \`%s\` | %s | %.2f | %.2f | %.2f |\n" \
        "$command" \
        "$(date "$TIMESTAMP_FORMAT")" \
        "$real_time" \
        "$user_time" \
        "$sys_time" >> "$LOG_FILE"
    
    echo " done (${real_time}s)"
}

# Run benchmarks for specified targets
TARGETS=("clean" "build-json" "build-bin")

for target in "${TARGETS[@]}"; do
    if grep -q "^$target:" Makefile; then
        benchmark "$target"
    else
        echo "Skipping non-existent target: $target"
    fi
done


echo -e "\nBenchmark results saved to $LOG_FILE"
# Run your make commands - used for THM
benchmark elastic-idx-clear
benchmark elastic-idx-build
benchmark elastic-idx-init
