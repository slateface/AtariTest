**Atari 2600 Checkers** (Work in Progress)
This repository documents an Atari 2600 homebrew project, developed from first principles using 6502 assembly.
The long-term goal is to build a playable checkers-style board game, while learning and documenting the realities of programming the Atari 2600 hardware directly.
This project prioritizes understanding over speed, and deliberately avoids frameworks or prebuilt engines.

**Project Goals**
•	Learn the Atari 2600 hardware model in depth
•	Build a scanline-accurate NTSC display kernel
•	Render a checkerboard playfield using TIA playfield registers
•	Implement a movable cursor using Player 0
•	Incrementally add input handling, game state, and rules

**Current State**
Stable 262-scanline NTSC frame
Scanline-accurate visible kernel
Asymmetric checkerboard playfield rendered via PF0/PF1/PF2
First-scanline preload artifacts correctly resolved
Player 0 rendered as a cursor overlay
Clean sprite timing (no mid-row corruption)
Builds and runs reliably in Stella
Status: A stable checkerboard kernel with a correctly rendered Player 0 cursor.

**What This Project Uses**
Hardware / Emulation
•	Atari 2600 (target platform)
•	NTSC timing model
•	Stella emulator (for development and testing)
Toolchain
•	DASM – 6502 assembler
•	Stella – Atari 2600 emulator
•	Make – build automation
Development Environment
•	Raspberry Pi 5
•	Raspberry Pi OS (Bookworm, ARM64)

**Repository Structure**
AtariTest/
├── src/
│   ├── main.asm        # Frame loop, VBLANK, VSYNC, and high-level flow
│   └── kernel.asm      # Visible kernel (playfield + cursor rendering)
├── include/
│   ├── vcs.h           # TIA register definitions
│   └── macro.h         # DASM helper macros (CLEAN_START, etc.)
├── build/
│   └── checkers.bin    # Output ROM (generated)
├── Makefile
└── README.md

**Build & Run**
Build the ROM
'make'
Run in Stella
'make run'
Clean build artifacts
'make clean'

**What I’ve Learned So Far**
•	How the Television Interface Adapter (TIA) works
•	Scanline-based rendering and strict timing constraints
•	Playfield layout and asymmetry
•	Player sprite lifetime and latching behaviour
•	The importance of preload state during VBLANK
•	Debugging timing-sensitive code with minimal tooling
This project uses the original Stella Programmer’s Guide (1979) as a primary reference.

**Why Atari 2600?**
Because it offers:
•	No frame buffer
•	No abstraction
•	76 CPU cycles per scanline
•	Direct exposure to hardware/software boundaries
It’s an ideal environment for learning discipline, timing, and clarity in low-level programming.

**Next Steps**
•	Cursor movement (up/down/left/right)
•	Board state stored in RAM
•	Rendering checker pieces (Player 1 / missiles)
•	Input handling
•	Game rules and turn logic

**Notes**
This is a learning-focused project, not a finished game.
Code clarity and correctness matter more than speed of completion.
