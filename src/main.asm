
; -------------------------------------------------
; main.asm
; Entry point for Atari 2600 Checkers
; -------------------------------------------------

    processor 6502

    include "vcs.h"
    include "macro.h"

; -------------------------------------------------
; ROM layout
; -------------------------------------------------
;   seg Code - commented out to keep segment offsets from causing jsr values >$10000
    org $F000

    include "kernel.asm"

; -------------------------------------------------
; Reset
; -------------------------------------------------
Start:
    CLEAN_START

MainLoop:
; =================================================
; VSYNC (3 scanlines)
; =================================================
    lda #2
    sta VSYNC

    sta WSYNC
    sta WSYNC
    sta WSYNC

    lda #0
    sta VSYNC

; =================================================
; VBLANK (37 scanlines)
; Logic lives here
; =================================================
    lda #2
    sta VBLANK

; ---- PRELOAD VISUAL STATE (while beam is OFF) ----

    lda #$0E
    sta COLUBK          ; background color

    lda #$02
    sta COLUPF          ; playfield color

    lda #%00000100      ; changed from lda #0
    sta CTRLPF          ; asymmetric playfield (no mirror)

    ; preload PF for first visible row
    lda #%00000000
    sta PF0
    lda #%01111100
    sta PF1
    lda #%11111000
    sta PF2
; -------------------------------------------------

    lda #$1E
    sta COLUP0        ; bright white cursor

    lda #0
    sta REFP0         ; no reflection

    lda #72           ; initial X position (left half)
    sta RESP0         ; position Player 0

    lda #0
    sta GRP0

;--------------------------------------------------

    jsr ReadInput        ; joystick, button
    jsr GameLogic        ; state machine (stub)
    jsr UpdateAudio      ; sound tick (stub)

    ldx #37

VBlankLoop:
    sta WSYNC
    dex
    bne VBlankLoop

; =================================================
; Visible frame (192 scanlines)
; Drawing lives here
; =================================================
    lda #0
    sta VBLANK

    jsr DrawKernel       ; board + cursor (stub)

; =================================================
; Overscan (30 scanlines)
; Cleanup / AI think time
; =================================================
    lda #2
    sta VBLANK

    jsr AILogic          ; CPU move selection (stub)

    ldx #30
OverscanLoop:
    sta WSYNC
    dex
    bne OverscanLoop

    jmp MainLoop

; -------------------------------------------------
; Stub routines (to be moved later)
; -------------------------------------------------

ReadInput:
    rts

GameLogic:
    rts

UpdateAudio:
    rts

AILogic:
    rts

; -------------------------------------------------
; Vectors
; -------------------------------------------------
    org $FFFC
    .word Start
    .word Start
