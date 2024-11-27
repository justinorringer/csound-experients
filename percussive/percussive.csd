<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
    ; Kick drum sound
    iamp = p4
    ifreq = p5
    idecay = p6
    inoise_decay = 0

    ; Generate a sine wave for the body of the kick
    asig oscili iamp, ifreq, 1

    ; Apply an exponential decay envelope

    kenv expon 1, idecay, 0.001
    anoise rand iamp * 0.05       ; noise kinda like a snare rattle
    kenv_noise expon 1, inoise_decay, 0.001
    anoise = anoise * kenv_noise
    
    apink  pinkish iamp * 0.7    ; pink noise for a bit of a tail
    apitch butbp apink, ifreq, ifreq + 100
    asig = (asig + apitch) * kenv

    ; Output the sound to both channels
    outs asig, asig
endin

</CsInstruments>
<CsScore>
; Define a sine wave function table
f 1 0 4096 10 1

; Schedule the kick drum sound
; p4 = amplitude, p5 = frequency, p6 = decay time
i 1 0 1 0.8 220 0.2
i 1 1 1 0.8 60 0.3
i 1 2 1 0.8 220 0.4
i 1 3 1 0.8 60 0.5

e
</CsScore>
</CsoundSynthesizer>
