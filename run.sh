#!/bin/bash

# Script description: Run LeetCode problem solution
# This script pipes input from a text file to the compiled C++ program
# Usage: ./script.sh <project-name> [options]

# Exit on any error
set -e

# Function to display usage information
usage() {
    echo "Usage: $0 <project-name> [options]"
    echo ""
    echo "Arguments:"
    echo "  project-name   Name of the problem project (e.g., problem-0713-subarray-product-less-than-k)"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -v, --verbose  Enable verbose output"
    echo ""
    echo "Example:"
    echo "  $0 problem-0713-subarray-product-less-than-k"
    echo "  $0 problem-0713-subarray-product-less-than-k -v"
    exit 1
}

# Function to log messages (only when verbose)
log() {
    if [ "$VERBOSE" = true ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    fi
}

# Initialize variables
VERBOSE=false
PROJECT_NAME=""

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    echo "Error: Project name is required!"
    usage
fi

# Get project name (first argument)
PROJECT_NAME="$1"
shift

# Parse remaining command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

# Construct paths based on project name
INPUT_FILE="./${PROJECT_NAME}/input.txt"
EXECUTABLE="./cmake-build-debug/${PROJECT_NAME}/${PROJECT_NAME}"

# Main script logic
main() {
    log "Starting LeetCode problem solution: $PROJECT_NAME"

    log "Project name: $PROJECT_NAME"
    log "Input file: $INPUT_FILE"
    log "Executable: $EXECUTABLE"

    # Check if input file exists
    if [ ! -f "$INPUT_FILE" ]; then
        echo "Error: Input file '$INPUT_FILE' not found!"
        echo "Make sure the project directory contains an input.txt file."
        exit 1
    fi

    # Check if executable exists and is executable
    if [ ! -f "$EXECUTABLE" ]; then
        echo "Error: Executable '$EXECUTABLE' not found!"
        echo "Make sure the project is compiled with CMake."
        exit 1
    fi

    if [ ! -x "$EXECUTABLE" ]; then
        echo "Error: '$EXECUTABLE' is not executable!"
        echo "Try rebuilding the project with CMake."
        exit 1
    fi

    # Run the command
    log "Executing: cat '$INPUT_FILE' | '$EXECUTABLE'"

    cat "$INPUT_FILE" | "$EXECUTABLE"

    log "Execution completed successfully"
}

# Run the main function
main "$@"
