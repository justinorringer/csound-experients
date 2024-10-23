; I want to use a counter to determine the rythmn of the piece
; have the counter change from 4 bit to 3 bit to 2 bit
; on overflow, have a sound play

sr = 44100
kr = 4410
ksmps = 10
nchnls = 2
0dbfs = 1

gicount init 0
gibit   init 3

gievent_count init 0

instr 1
    schedule 2, 0, p4
endin

instr 2
clock:
    timout 0, 1, count
    reinit clock

count:
    gicount = gicount + 1
    if gicount == 2^gibit then
        gicount = 0
        gibit = gibit - 1
        if gibit == 0 then
            gibit = 4
        endif
    endif

    print gicount, gibit
    if gicount == gievent_count then
overflow:
        prints "overflow"
        kgate linen 	.5, 0, 1, .1
    a1  oscili kgate, 220, 1
        out a1
    endif
    rireturn
endin
