sr = 44100
kr = 4410
ksmps = 10
nchnls = 1

    instr   101      ; SIMPLE OSCILLATOR
a1  oscil   10000, 440, 1
    out     a1
    endin

    instr   102      ; SIMPLE FM
a1  foscil  10000, 440, 1, 2, 3, 1
    out     a1
    endin

    instr   103      ; SIMPLE BUZZ
a1  buzz    10000, 440, 10, 1
    out     a1
    endin

    instr   104      ; SIMPLE WAVEGUIDE
a1  pluck   10000, 440, 440, 2, 1
    out     a1
    endin

    instr   105      ; SIMPLE GRANULAR
a1  grain   10000, 110, 55, 10000, 10, .05, 1, 3, 1
    out     a1
    endin

    instr   106      ; SIMPLE WAVETABLE
a1  loscil  10000, 440, 4
    out     a1
    endin
