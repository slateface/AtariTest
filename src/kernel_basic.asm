    processor 6502

    include "vcs.h"
    include "macro.h"

    seg Code
    org $F000

Start:
    CLEAN_START          ; macro from macro.h (sets stack, clears RAM/TIA state)

MainLoop:
; -------------------------
; VSYNC: 3 scanlines
; -------------------------
    lda #2
    sta VSYNC

    sta WSYNC            ; line 1
    sta WSYNC            ; line 2
    sta WSYNC            ; line 3

    lda #0
    sta VSYNC

; -------------------------
; VBLANK: 37 scanlines
; -------------------------
    lda #2
    sta VBLANK           ; turn on blanking (beam off)

    ldx #37
VBlankLoop:
    sta WSYNC
    dex
    bne VBlankLoop

; -------------------------
; Visible: 192 scanlines
; -------------------------
    lda #0
    sta VBLANK           ; beam on (start visible picture)

    lda #$2C             ; background color (NTSC value; $2C tends to look yellow in Stella)
    sta COLUBK

    ldx #192
VisibleLoop:
    sta WSYNC            ; one scanline
    dex
    bne VisibleLoop

; -------------------------
; Overscan: 30 scanlines
; -------------------------
    lda #2
    sta VBLANK           ; beam off for overscan

    ldx #30
OverscanLoop:
    sta WSYNC
    dex
    bne OverscanLoop

    jmp MainLoop

; -------------------------
; Vectors
; -------------------------
    org $FFFC
    .word Start          ; Reset vector
    .word Start          ; IRQ/BRK vector (unused on 2600)
B
B
B

