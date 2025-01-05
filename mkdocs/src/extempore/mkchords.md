
# Making scales and chords

A summary of the chords functions available, in the `mk` namespace, to create harmonic structures like scales and chords. 

All of these functions take either a chord symbol or a scale symbol. 

```scheme
; sym chords
'M|m|Msus|M4|M6|M64|M7|M65|M43|M42|M2|M7#4|M9|7|9|65|43|2|42|msus|m4|m6|m64|m7|m65|m43|m42|m2|m9|m7b5|d|d6|d64|d7|d65|d43|d42|d2

; sym scales
'M|m|pentatonic|wholetone|chromatic|octatonic|messiaen1|messiaen2|messiaen3|messiaen4|messiaen5|messiaen6|messiaen7|ionian|dorian|phrygian|lydian|lydian-dominant|lydian-mixolydian|mixolydian|aeolian|locrian
```


## Chords

```scheme
(mkchord root 'chordsym )
(mkchordrand root 'chordsym )
(mkchordsteps root '(steps) 'scalesym )
(mkchordiatonic root 'maj-min 'degree) ; chordsym either M or m TODO
```

These are enhanced versions of the `pc` functions. 

Deprecated:

```scheme
(pc:chord root 'chordsym )
(pc:make-chord lower upper number pcchord)
(pc:make-chord-fixed pitch number pcchord)
(pc:diatonic root '^- 'i)
```

The only advantage of pc:make-chord is that it can table a list of pitch classes, while mkchord just chord syms EG

```
(pc:make-chord-fixed C4 3 
        '(0 4 7) 
)
```



## Melody

Makes a melody from a root pitch and a scale.

```
(mkmelody 4 60 'm '(1 -1) )
```


## Scales

```scheme
(mkscale root 'scale-sym )
(mkscalestep root step 'scale-sym) ;; transpose the scale beginning
```
These are enhanced versions of the `pc` functions IE

```scheme
;; snippets deprecated
(pc:scale 0 'scale-sym )
```


## Intervals

```
(mkint C4 3 'scale-sym )
(mkrandom C3 C6 'pitch-list-or-scale-sym ) ; simple wrapper around pc:random
(mkquant 61 'pitch-list-or-scale-sym  )
```

Deprecated 

```
(mkrel 60 8 'M ) ; same as mkint
(pc:random 60 80 'plist)
(pc:quantize 60 'plist)
```
