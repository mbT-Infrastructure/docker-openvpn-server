#!/usr/bin/env bash
set -e

# Check arguments
CIDR_NOTATION="$1"

ADDRESS="${CIDR_NOTATION%%/*}"
CIDR_SUFFIX="${CIDR_NOTATION##*/}"

BINARY_MASK=""
for ((i=0; i<32; i++)); do
    if [[ "$i" -gt 0 ]] && [[ "$((i % 8))" -eq 0 ]]; then
        BINARY_MASK+=.
    fi
    if [[ $i -lt $CIDR_SUFFIX ]]; then
        BINARY_MASK+="1"
    else
        BINARY_MASK+="0"
    fi
done

MASK=""
REMAINING_BINARY_MASK="$BINARY_MASK"
while [[ -n "$REMAINING_BINARY_MASK" ]]; do
    CURRENT_PART="${REMAINING_BINARY_MASK%%.*}"
    REMAINING_BINARY_MASK="${REMAINING_BINARY_MASK#"${CURRENT_PART}"}"
    REMAINING_BINARY_MASK="${REMAINING_BINARY_MASK#.}"
    MASK+="$((2#$CURRENT_PART))"
    if [[ -n "$REMAINING_BINARY_MASK" ]]; then
        MASK+="."
    fi
done

echo "$ADDRESS $MASK"
