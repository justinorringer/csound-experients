; I want to use a counter to determine the rythmn of the piece
; have the counter change from 4 bit to 3 bit to 2 bit
; on overflow, have a sound play

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gicount init 0
gibit   init 3

gklock init 1
instr 1
    schedule 2, 0, p4
endin

instr 2
clock:
    timout 0, 1, count
    reinit clock
    turnoff

count:
    gicount = gicount + 1
    if gicount == 2^gibit then
        gicount = 0
        gibit = gibit - 1
        if gibit == 0 then
            gibit = 4
        endif
        prints "overflow"

        if (gklock != 0) then
            event "i", 100, 0, 1, 1000, 440
            gklock = 0
            event "i", 3, 1, 1
        endif
    endif

    print gicount, gibit
    rireturn
endin

instr 3
unlock:
    gklock = 1
    rireturn
endin

; basic oscilator
instr 100
    a1 oscili p4, p5, 1
    out a1
endin
