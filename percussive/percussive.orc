;---------------------------------------------------------
; 3 Drums
; Coded by Hans Mikelson October 9, 1999
; pulled from https://csoundjournal.com/ezine/autumn1999/synthesis/
;---------------------------------------------------------
sr      =        44100                      ; Sample rate
kr      =        44100                      ; Kontrol rate
ksmps   =        1                          ; Samples/Kontrol period
nchnls  =        2                          ; Normal stereo

;---------------------------------------------------------
; FM Tom-Tom
;---------------------------------------------------------
       instr     12

idur   =         p3            ; Duration
iamp   =         p4            ; Amplitude
ifqc   =         cpspch(p5)    ; Convert pitch to frequency
irez   =         p6            ; Resonance or Q
ifco   =         p7            ; Cut off frequency
ihit   =         p8            ; Noise duration
ihamp  =         p9            ; Noise amplitude
ipanl  =         sqrt(p10)     ; Pan left
ipanr  =         sqrt(1-p10)   ; Pan right

afqc1  linseg    1+iamp/30000, ihit*.5*idur, 1, .1, 1 ; Pitch bend
afqc   =         afqc1*afqc1                       ; Pitch bend squared
adclck linseg    0, .002, 1, idur-.004, 1, .002, 0 ; Declick envelope
aamp1  expseg    .01, .001, 1, idur-.001, .04      ; Tone envelope
aamp2  expseg    .01, .001, 1, idur*ihit-.001, .01 ; Noise envelope

arnd1  rand      ihamp                          ; Genrate noise
arnd   rezzy     arnd1, ifco, irez, 1           ; High pass mode
asig   oscil     1, afqc*ifqc*(1+arnd*aamp2), 1 ; Frequency modulation with noise

aout   =         asig*iamp*aamp1*adclck         ; Apply amp envelope and declick

       outs      aout*ipanl, aout*ipanr         ; Output the sound

       endin
