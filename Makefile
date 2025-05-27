# Makefile for LeetCode problems

# Default project name (can be overridden)
PROJECT ?= problem-0713-subarray-product-less-than-k

# Script path
SCRIPT = ./run_leetcode.sh

# Build debug artifact the projects
.PHONY: debug
debug:
	@./debug.sh

# Run a project (usage: make run PROJECT=problem-name)
.PHONY: debug
run: debug
	@./run.sh $(PROJECT)

# Run a project with verbose output
.PHONY: run-verbose
run-verbose: debug
	@./run.sh $(PROJECT) -v

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build               - Build debug artifact the projects"
	@echo "  run                 - Build and run default project ($(PROJECT))"
	@echo "  run-verbose         - Build and run default project with verbose output"
	@echo ""
	@echo "Examples:"
	@echo "  make run PROJECT=problem-0001-two-sum"
	@echo "  make run-verbose PROJECT=problem-0001-two-sum"
