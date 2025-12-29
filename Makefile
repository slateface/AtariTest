# Atari 2600 Makefile
# -------------------

ASM      = dasm
SRC      = src/main.asm
OUT      = build/checkers.bin
INCLUDES = -Iinclude -Isrc
FLAGS    = -f3

# Default target
all: $(OUT)

# Build ROM
$(OUT): $(SRC)
	mkdir -p build
	$(ASM) $(SRC) $(INCLUDES) $(FLAGS) -o$@

# Run in Stella
run: $(OUT)
	stella $(OUT)

# Clean build artifacts
clean:
	rm -rf build

.PHONY: all run clean
