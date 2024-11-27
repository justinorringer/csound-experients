; sr = 44100
; ksmps = 32
; nchnls = 3
; 0dbfs = 1

gkReverb init 0

		instr	100
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq	
afilt	tone	anoise, kcut
aout    =  	    afilt*kenv

gkReverb =      gkReverb + aout
		out  	aout
		dispfft	afilt, idur, 4096
		endin

		instr	101
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
aosc    oscili  iamp, ifrq
afilt	tone	aosc, kcut
aout    =  	    afilt*kenv

gkReverb =      gkReverb + aout
		out  	aout
		dispfft	afilt, idur, 4096
		endin

instr Reverb
    aInput = gkReverb
    gkReverb = 0  ; Reset the global reverb send

    aReverbL, aReverbR reverbsc aInput, aInput, 0.85, sr/ksmps
    outs aReverbL, aReverbR
endin

schedule("Reverb", 0, -1)

; 		instr 	2
; idur	=		p3					
; irvbtim	=		p4
; ihiatn	=		p5
; arvb	reverb2	garvb, irvbtim, ihiatn
; 		out		arvb
; garvb	=		0
; 		endin
