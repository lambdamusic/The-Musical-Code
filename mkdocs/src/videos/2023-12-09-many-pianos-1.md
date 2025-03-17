---
author: Michele Pasin
title: "Dreamy pianos - Study No 1 in C Minor (2023-12)"
description: "Me having fun with various overlapping piano numerical patterns."
date: 2023-12-09
review: false
categories: 
  - "computermusic"
tags: 
  - "algorithmiccomposition"
  - "extempore"
  - "livecoding"
---


Overlapping cosine driven piano lines in C minor.

<iframe width="560" height="315" src="https://www.youtube.com/embed/MpRG82Yyq4Q?si=MCyauaVxt5wlp94X&autoplay=1&amp;start=210" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>



## Full source

```scheme
; MANY PIANOS IN C MINOR
; ---------------------------------
; piano cycles and fun
; use simple controls modifiers for variations


(define piano 1) ;; ZebraHZ: HS Another Time Another Space
(define piano2 2) ;; Zebra2: HS Rough Tongue Bass
(define piano3 3) ;; Grand Piano
(define piano4 4) ;; E Piano Rhodes
(define piano5 5) ;; Analog Lab: Acid 2 Water Piano  /TBC
(define piano6 6) ;; Analog Lab: Japanese Home Clean
(define strings 7) ;; LABS: Guitar Harmonics Gieger

(:tempo 120)

(define root C4)
(define mode 'm)


(define pianos
  (lambda (beat dur)

    (at 1/2 0 (play piano (:mkrel root (cosr 5 (cosr 5 5 5/2) 1/19) mode) (cosr 40 20 7/2) 1/4))   
    (at 1/2 0 (play piano2 (:mkrel C3 (cosr 5 (cosr 5 5 9/2) 1/29) 'm) (cosr 30 20 15/2) 1/4))   

    (at 1/2 0 (play (oneof 1/2 1/4 0) piano3 (:mkrel (:mkint root  -8) (cosr (cosr 5 2 .01) (cosr 5 5 5/2) 1/39) mode) (cosr 60 30 15/2) 1/2))   
    (at 1/2 0 (play piano3 (:mkrel (:mkint root  -8) (cosr (cosr 5 2 .01) (cosr 5 5 5/2) 1/39) 'm) (cosr 30 20 15/2) 1/2))   

    (at 1/2 0 (play piano4 (:mkrel G3 (cosr (cosr 8 2 .002) (cosr 5 5 5/2) 1/39) mode) (cosr 30 15 .5) 1/4))   
    
    (at 1/2 0 (play piano5 (:mkrel C4 (cosr 5 (cosr 5 5 5/2) 1/39) mode) (cosr 50 30 .5) 1/4))   
    
    (at 1 0 (play strings (:mkrel root (cosr 5 (cosr 5 5 5/2) 1/39) mode) (cosr 80 20 .01) 1/2))   

    (callback (*metro* (+ beat (* 1/2 dur))) 
        'pianos (+ beat dur) dur)))

(pianos (*metro* 'get-beat 1) 1/16)
```

Also on [GitHub](https://github.com/lambdamusic/The-Musical-Code/blob/main/works/2023-11-many-pianos-in-c-minor.xtm).