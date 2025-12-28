# Atari 2600 Makefile
# -------------------

ASM      = dasm
SRC      = src/solid_color.asm
OUT      = build/solid_color.bin
INCLUDES = -Iinclude
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
