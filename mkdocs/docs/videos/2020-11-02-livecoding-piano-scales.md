---
author: Michele Pasin
title: "Piano Scales (2020-11)"
author: <your name>
description: "A new livecoding composition using Extempore and Ableton Live: 'Piano Scales'."
date: 2020-11-02
categories: 
  - "computermusic"
tags: 
  - "algorithmiccomposition"
  - "extempore"
review: false
---


In general, [algorithmic compositions](https://en.wikipedia.org/wiki/Algorithmic_composition) using piano instruments always strike me for their captivating simplicity. So here's a new little experiment, titled ['Piano Scales](https://www.youtube.com/watch?v=Qix3tbpb9V4)'.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qix3tbpb9V4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Repeated scales with a touch of randomness

The gist of this musical algorithm is amazingly simple. 

Pick a scale. You play it using a variable time-interval between its notes, which is determined by a cosine function ([`cosr`](https://extempore.michelepasin.org/1030.html)). The variable interval gives the final result a touch of suspense and makes it less computer-like. 

```scheme
(define xsc 
	(lambda (beat vel scale) 
		(let ((dur (cosratio 4 2 1/128)))
```

After each note, more notes are played programmatically, after brief (random) intervals of half a beat, or 3/2 of a beat. Fifths, octaves, minor sevenths... as you please.

This whole thing repeating itself, at each iteration of the loop though the sound volume gets quieter by a fixed amount. Eventually, when the volume goes to 0, the repetition stops. 

```scheme
(define xsc
  (lambda (beat vel scale)
    (let ((dur (cosratio 4 2 1/128)))

      ;; piano
      (play (car scale) vel dur 1)
      (play 5 (+ 12 (car scale)) 1 (* dur 2) 1)
      (play (oneof 3/2 2) (+ 24 (car scale)) 1 (* dur 2) 1)

      ;; bass
      (play 5 (car scale) 90 (* dur 2) 2)
      (:chance .8 (play 6 (+ (car scale) 2) 90 (* dur 2) 2))

      ;; repeat
      (set! scale (rotate scale -1))
      (set! vel (- vel 1))

      (if (> vel 0)
        (callback (*metro* (+ beat (* 1/2 dur))) 'xsc 
          (+ beat dur)
          vel
          scale)))))


;; set scale to play so that scales overlap with each other

(xsc (*metro* 'get-beat 1) 
  50 ; vol 
  (:mkscale c1 'pentatonic 2)) 
  ;; run again with 'ionian, 'aeolian etc.. for interesting harmonic effects
```

The full source code on [GitHub](https://github.com/lambdamusic/The-Musical-Code/blob/main/works/2020-11-piano-scales.xtm).

## About Extempore

> [Extempore](https://extemporelang.github.io/) is a programming language and runtime environment designed by [Andrew Sorensen](https://twitter.com/digego?lang=en) to support livecoding and cyberphysical programming, where a human programmer operates as an active agent in the world. 
> 
> [Algorithmic composition](https://en.wikipedia.org/wiki/Algorithmic_composition) is the technique of using algorithms to create music.

