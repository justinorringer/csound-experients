# csound-experients

Notes from *The CSound Book*, edited by Richard Boulanger
Copy of sounds and notes from CD luckily in [this repo](https://github.com/SamKomesarook/The-Csound-Book)

## Orchestra
Generic opcode statement:
```
Ouput Opcode Arguments Comment (optional)
```

```
output oscil amplitude, frequency, function # ; COMMENT
a1   oscil 10000, 440, 1 ; OSCILLATOR
```

Default header
```
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1
```

## Score
- has table and notes sections
- tables
  - use mathematical function drawing subroutines GEMS to generate function tables (f-tables)
- notes
  - contains note-statements
  - performs instruments, passing them performance paramters such as frequency-settings, amplitude, vibrato, attack-times

### Syntax
```
f number loadtime table-size GEN Routine parameter1 parameter...

<!-- Generates a 16-point sinewave -->
f   111     16      10      1
```

### GENS
- more than 20 subroutines optimized to computer functions or wavetables

GEN5 and GEN7 construct functions from segments of exponential curves or straight lines
GEN9 and GEN10 subroutines generate composite waveforms of sums o simple sinusoids
GEN20 gemerates window functions (?) ex. Hamming and Kaiser window
- used for spectrum analysis and grain envelopes
GEN21 computes tables with random distributions. ex. Gaussian, Cauchy, and Poison
GEN1 transfers data from prerecorded soundfiles into a function table
- used in looping oscillator loscil command as an ex.


### Default orchestral header
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1


### opcodes
oscil k/amp, k/cps, ifn[, iphs]
foscil xamp, kcps, kcar, kmod, kndx, ifn[, iphs]
buzz xamp, xcps, knh, ifn[, iphs]
pluck kamp, kcsps, icps, ifn imeth[,..]
grain xamp, xpitch, xdens, kampoff, kpitchoff, kgdur, igfn, iwfn, imgdur
loscil xamp, kcps, ifn