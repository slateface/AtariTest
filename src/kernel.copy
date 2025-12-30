; -------------------------------------------------
; kernel.asm
; Draws static checkerboard playfield
; -------------------------------------------------

    include "vcs.h"

; -------------------------------------------------
; DrawKernel
; Called once per frame during visible scanlines
; Must generate exactly 192 WSYNCs
; -------------------------------------------------

DrawKernel:

    ldy #8              ; 8 checkerboard rows

RowLoop:
    sta WSYNC    ;align to start of scanline before PF writes
    ; -----------------------------
    ; Pattern A: dark-light-dark-light
    ; -----------------------------

    ; Cursor visible only on row 4 (24 scanlines tall)
    cpy #4
    ;bne CursorOffRow  -newly disabled
    beq CursorOnRow ;newly added
    cpy #3          ;newly added
    beq CursorOnRow ;newly added

CursorOffRow:
    lda #0
    sta GRP0
    jmp CursorRowSet

CursorOnRow:
    lda CursorBitmap
    sta GRP0
    ;jmp CursorRowSet -newly disabled

CursorRowSet:
    lda #%00010000
    sta PF0
    lda #%00111110
    sta PF1
    lda #%11110000
    sta PF2

    ldx #24
RowALines:
    sta WSYNC
    dex
    bne RowALines

    dey
    beq DoneKernel

    ; -----------------------------
    ; Pattern B: light-dark-light-dark
    ; -----------------------------
    lda #%11100000
    sta PF0
    lda #%11000001
    sta PF1
    lda #%00001111
    sta PF2

    ldx #24
RowBLines:
    sta WSYNC
    dex
    bne RowBLines

    dey
    bne RowLoop

DoneKernel:
    rts

CursorBitmap:
    .byte %00111100
