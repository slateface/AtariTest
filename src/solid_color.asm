    processor 6502

    include "vcs.h"
    include "macro.h"

    seg Code
    org $F000

Start:
    sei
    cld
    ldx #$FF
    txs

    lda #$2C        ; blue
    sta COLUBK

Loop:
    jmp Loop

    org $FFFC
    .word Start
    .word Start

