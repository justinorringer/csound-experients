
; Function 1 uses the GEN10 subroutine to compute a sine wave
; Function 2 uses the GEN10 subroutine to compute the first sixteen partials of a sawtooth wave
; Function 3 uses the GEN20 subroutine to compute a Hanning window for use as a grain envelope
; Function 4 uses the GEN01 subroutine to read in an AIF audio file

f 1  0 4096 10   1
f 2  0 4096 10   1  .5 .333 .25 .2 .166 .142 .125 .111 .1 .09 .083 .076 .071 .066 .062
f 3  0 4097 20   2  1
f 4  0 0    1   "sing.aif" 0 4 0


;p1     p2      p3
;inst   start   duration
i 106       0       2
i 106       2      .4      ; beat drop bro
i 106       2.5     .4
i 106       3     .4
i 106       3.5     .4

i 106       4.5     .4
i 106       4.5     .4
i 106       5     .4
i 106       5     .4
i 106       5.5     .4
i 106       5.5     .4
i 106       5.5     .4

i 106       6.9     .2
i 106       7.1     .4
i 106       7.5     .4
i 106       7.9     .4
i 106       8.25     .4
i 106       8.6     .4
i 106       8.95     .4

i 102       3.5     2
i 103       4       2
i 104       4.5     2
i 105       6.8     2
i 102       6.5     .3
i 101       7.5     4
i 106       11       4

; i 102       3.5     2
; i 103       4       2
; i 104       4.5     2
; i 105       6.8     2
; i 101       7.5     4
