#!/bin/bash

# Script to build all benchmarks and generate assembly dumps
# Usage: ./generate_all_asm.sh

set -e  # Exit on error

# Define all benchmarks
BENCHMARKS=(
    "activity_recognition"
    "bitcount"
    "bitcount_cmp"
    "blowfish"
    "cem"
    "cuckoo"
    "dnn"
    "event_monitor"
    "kvstore"
    "message_queue"
    "periodic_sensing"
    "rsa"
)

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=====================================${NC}"
echo -e "${BLUE}Glacier Benchmark ASM Generator${NC}"
echo -e "${BLUE}=====================================${NC}"
echo ""

# Create asm_dumps directory if it doesn't exist
mkdir -p asm_dumps

echo -e "${YELLOW}Step 1: Building all benchmarks...${NC}"
echo ""

# Build all benchmarks at once
cargo build --bins --release

echo ""
echo -e "${GREEN}✓ All benchmarks built successfully${NC}"
echo ""

echo -e "${YELLOW}Step 2: Generating assembly dumps...${NC}"
echo ""

# Generate assembly for each benchmark
for benchmark in "${BENCHMARKS[@]}"; do
    echo -e "  ${BLUE}Generating ASM for: ${benchmark}${NC}"

    # Path to the compiled binary
    BINARY="target/msp430-none-elf/release/${benchmark}"

    # Output assembly file
    ASM_FILE="asm_dumps/${benchmark}.asm"

    # Generate assembly dump using objdump
    # -D: Disassemble all sections (not just .text)
    # -h: Show section headers
    # -t: Show symbol table
   # msp430-elf-objdump -D -h -t "${BINARY}" > "${ASM_FILE}"
    msp430-elf-objdump -d "${BINARY}" > "${ASM_FILE}"

    # Get file size for reporting
    SIZE=$(wc -l < "${ASM_FILE}" | tr -d ' ')

    echo -e "    ${GREEN}✓${NC} ${ASM_FILE} (${SIZE} lines)"
done

echo ""
echo -e "${GREEN}=====================================${NC}"
echo -e "${GREEN}All assembly dumps generated!${NC}"
echo -e "${GREEN}=====================================${NC}"
echo ""
echo "Assembly files saved to: asm_dumps/"
echo ""

# Summary
echo "Summary:"
echo "--------"
for benchmark in "${BENCHMARKS[@]}"; do
    ASM_FILE="asm_dumps/${benchmark}.asm"
    if [ -f "${ASM_FILE}" ]; then
        SIZE=$(wc -l < "${ASM_FILE}" | tr -d ' ')
        printf "  %-25s %6s lines\n" "${benchmark}.asm" "${SIZE}"
    fi
done
