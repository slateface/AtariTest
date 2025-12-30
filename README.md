**Atari 2600 Checkers** (Work in Progress)<br/>
This repository documents an Atari 2600 homebrew project, developed from first principles using 6502 assembly.
The long-term goal is to build a playable checkers-style board game, while learning and documenting the realities of programming the Atari 2600 hardware directly.
This project prioritizes understanding over speed, and deliberately avoids frameworks or prebuilt engines.

**Project Goals**<br/>
•	Learn the Atari 2600 hardware model in depth<br/>
•	Build a scanline-accurate NTSC display kernel<br/>
•	Render a checkerboard playfield using TIA playfield registers<br/>
•	Implement a movable cursor using Player 0<br/>
•	Incrementally add input handling, game state, and rules<br/>

**Current State**<br/>
Stable 262-scanline NTSC frame<br/>
Scanline-accurate visible kernel<br/>
Asymmetric checkerboard playfield rendered via PF0/PF1/PF2<br/>
First-scanline preload artifacts correctly resolved<br/>
Player 0 rendered as a cursor overlay<br/>
Clean sprite timing (no mid-row corruption)<br/>
Builds and runs reliably in Stella<br/>
Status: A stable checkerboard kernel with a correctly rendered Player 0 cursor.<br/>

**What This Project Uses**<br/>
Hardware / Emulation<br/>
•	Atari 2600 (target platform)<br/>
•	NTSC timing model<br/>
•	Stella emulator (for development and testing)<br/><br/>
Toolchain<br/>
•	DASM – 6502 assembler<br/>
•	Stella – Atari 2600 emulator<br/>
•	Make – build automation<br/><br/>
Development Environment<br/>
•	Raspberry Pi 5<br/>
•	Raspberry Pi OS (Bookworm, ARM64)

**Repository Structure**<br/>
AtariTest/<br/>
├── src/<br/>
│     ├── main.asm        # Frame loop, VBLANK, VSYNC, and high-level flow<br/>
│     └── kernel.asm      # Visible kernel (playfield + cursor rendering)<br/>
├── include/<br/>
│     ├── vcs.h           # TIA register definitions<br/>
│     └── macro.h         # DASM helper macros (CLEAN_START, etc.)<br/>
├── build/<br/>
│     └── checkers.bin    # Output ROM (generated)<br/>
├── Makefile<br/>
└── README.md

**Build & Run**<br/>
Build the ROM<br/>
`make`<br/>
Run in Stella<br/>
`make run`<br/>
Clean build artifacts<br/>
`make clean`

**What I’ve Learned So Far**<br/>
•	How the Television Interface Adapter (TIA) works<br/>
•	Scanline-based rendering and strict timing constraints<br/>
•	Playfield layout and asymmetry<br/>
•	Player sprite lifetime and latching behaviour<br/>
•	The importance of preload state during VBLANK<br/>
•	Debugging timing-sensitive code with minimal tooling<br/><br/>
This project uses the original Stella Programmer’s Guide (1979) as a primary reference<br/>

**Why Atari 2600?**<br/>
Because it offers:<br/>
•	No frame buffer<br/>
•	No abstraction<br/>
•	76 CPU cycles per scanline<br/>
•	Direct exposure to hardware/software boundaries<br/>
It’s an ideal environment for learning discipline, timing, and clarity in low-level programming<br/>

**Next Steps**<br/>
•	Cursor movement (up/down/left/right)<br/>
•	Board state stored in RAM<br/>
•	Rendering checker pieces (Player 1 / missiles)<br/>
•	Input handling<br/>
•	Game rules and turn logic<br/>

**Notes**<br/>
This is a learning-focused project, not a finished game.<br/>
Code clarity and correctness matter more than speed of completion.
