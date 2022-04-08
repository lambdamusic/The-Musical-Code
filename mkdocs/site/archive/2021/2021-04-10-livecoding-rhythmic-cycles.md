---
template: blog.html
author: Michele Pasin
title: "Composition: 'Rhythmic Cycles' with Extempore"
description: "A new livecoding composition using Extempore and Ableton Live: 'Rhythmic Cycles'."
date: 2021-04-10
categories: 
  - "computermusic"
tags: 
  - "algorithmiccomposition"
  - "extempore"
---

A new livecoding composition using [Extempore](https://extemporelang.github.io/) and Ableton Live: 'Rhythmic Cycles'. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/m3v8gRzROkU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Using 'map' to trigger repeated notes

The gist of this experiment rotates around the `map` function. 

A seed list of notes, and one of offsets , is used to generate musical `play` sequences:

```scheme
(map (lambda (x y z)
	  (onbeat x 0 (play y z (* dur .9) 1))
		)
	times
	notes
	volumes
	)
```

This technique generates a texture of sounds with a touch of randomness. 

If the pattern above gets repeated, changing the input parameters periodically leads to the generation of very interesting musical patterns. 

For example:

- times can be shifted up or down by 1/4 beat or so
- notes can be transposed using different chord structures
- volumes can use cyclical variations eg a cosine function

The end result reminds me of a hypnotical tune that keeps repeating but it's never exactly the same. Similar to 8-bit video game music patterns, but obviously when using more interesting sounds/instruments to begin with, the end result is more engaging too. 


## Source code

The full source code can be found on [Github](https://github.com/lambdamusic/The-Musical-Code/blob/main/works/2021-04-rhytmic-cycles.xtm).

```lisp

(define notes (list c3 g3 bb3))

(define times (:mklist 8 (oneof 1/2 1/4)))

(define inc
    (lambda (alist)
        (map (lambda (x)
                (if (< x 1) 
                    (ifr .7 (add 1/4 x) x) 0)
                )
            alist)
    ))


(define lp1
    (lambda (beat)
        (let ((dur 1/16)
              (v1 (cosr (cosr 50 18 1/64) 30 1/64))
              (v2 (cosr (cosr 50 18 1/150) 30 1/40))
              (fc 8))

            (println v1 v2)

            (onbeat 4 0 
                (set! times (inc times)))

            (onbeat 32 0
                (if (< v1 40)  
                    (set! notes (rotate notes -1))))

            (map (lambda (x y z)
                  (onbeat x 0 (play y z (* dur .9) 1))
                  (onbeat x 0 (play y z (* dur .9) 3))
                    )
                (slice fc times)
                (slice fc  (:mkchord (car notes) '-6 8))
                (slice fc  (list v1 v2 v1 v2 v1 v2 v1 v2))
                )

            (callback (*metro* (+ beat (* 1/2 dur))) 
                'lp1 (+ beat dur)))))

(lp1 (*metro* 'get-beat 1))
```



