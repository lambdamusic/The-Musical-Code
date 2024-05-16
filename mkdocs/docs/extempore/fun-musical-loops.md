---
title: "Musical Loops functions"
date: "2024-04-04"
categories: 
  - "snippets"
---

# Musical loop functions

A collection of [Extempore](https://extemporelang.github.io/) code snippets for creating different types of musical outputs. 

## 1. Loop with inner `dur`

The most basic version of the loop templates. `dur` as an inner variable is handy in case we want to change `dur` on the fly and derive other parameters from it in the function body. 

```scheme
(define lp1
 (lambda (beat)
   (let ((dur 1))

     (monitor beat dur)
   
     (callback-at dur 'lp1 )))) 
                      
(lp1 (*metro* 'get-beat 1))
```


## 2. Loop with `dur` as a function argument

Takes `dur` as a loop argument. Useful when we want to change `dur` INSIDE the function - ie based on some other process that happens in the function, so the next iteration should receive a preprocessed `dur`. 

Clearly this is a special case - normally `dur` is either fixed or randomly assigned, hence it does not have to be an argument.

```scheme
(define lp1
 (lambda (beat dur)
   
   (monitor beat dur)
   ;; EG change dur briefly every 8 beats
   (if= (modulo beat 8) 0  
    (set! dur 2) (set! dur 1)
   )

   (callback-at dur 'lp1 dur)))

(lp1 (*metro* 'get-beat 1) 1)
```



## 3. Loop with all `play` arguments

I.e. the 'explicit' loop. Here we are passing all `play` args so that they can be changed at each iteration. 

```scheme
(define lp1
    (lambda (beat pitch vol dur inst)
        (let ((dur dur))

           (monitor beat pitch vol dur inst)

            (callback-at dur 'lp1 
                pitch
                vol
                dur
                inst))))

(lp1 (*metro* 'get-beat 1) A3 90 1 1)
```


## 4. Rotating melody loop, external

Using notes and durs patterns as arguments, which rotate and get reset to the original lists when all elements have been used.

Note: since notes and durs are global variables, they can be easily changed outside the loop or reused by other functions etc..

```scheme
(define *melody* (mkchord 48 '-))
(define *durs* (mklist 4 (oneof 1/2 1)))

(define lp1
    (lambda (beat melody durs)
        (let ((dur (car durs)) 
              (p (car melody)))

                (monitor beat dur p)

            (callback-at dur 'lp1
                (cdr-or-else melody *melody*)
                (cdr-or-else durs *durs*)))))

(lp1 (*metro* 'get-beat 1) *melody* *durs*)
```


## 5. Rotating melody loop, internal 

Similiar to the external melody version, but the pattern arguments are internal and rotated periodically. 

This allows for example to call the same function multiple times with different notes and durs arguments, without having to duplicate code, generating overlapping musical patterns.

```scheme
(define lp1
 (lambda (beat notes durs)
   (let ((p (car notes))
         (dur (car durs)))
     
     (monitor beat p dur)
     
     (callback-at dur 'lp1
               (rotate notes -1)
               (rotate durs -1)))))

(lp1 (*metro* 'get-beat 1) '(60 67 69) '(4 2))
```


## 6. Rotating melody loop, internal, with 'deep' rotation

A variation of the rotate loop that takes a nested list of plists and takes one value from each plist per cycle, while rotating them, generating a two-voices alternating structure.

```scheme
(define lp1
  (lambda (beat notes durs)
    (let ((p (caar notes)) 
        (dur (car durs)))

        (monitor beat p dur )

  (callback-at dur 'lp1 
        (rotatedeep notes -1) 
        (rotate durs -1)))))

(lp1 (*metro* 'get-beat 1) '((60 67 69) (48)) '(4 2))
```

See also

- [rotatedeep](https://extempore.michelepasin.org/def/rotatedeep.html)  


## 7. Loop with `map` + `play` pattern

A more complex pattern playing structure that maps over several lists. It's a terse structure that permits to generate many rythmic and harmonic variations by modifying the external `times`, `notes` and `vols` periodically.

```scheme
(define times (mklist 4 (oneof 1/2 1/4)))
(define notes (mkchordrandom A3 'm6 4 100))
(define vols (mklist 4 (oneof 50 90)))

(define lp1
  (lambda (beat)
    (let ((dur 1/16))

      (map (lambda (t p v)
          (onbeat t 0 (monitor p v dur ))
          )
        times notes vols)

      (callback-at dur 'lp1))))

(lp1 (*metro* 'get-beat 1))
```

See also

- [Rythmic Cycles on YouTube](https://www.youtube.com/watch?v=m3v8gRzROkU) uses this pattern


## 8. Loop with `every`

Allows to express conditions in relation to the loop (iteration) count, by passing an extra parameter `lc`. 

```scheme
(define lp1
  (lambda (beat dur lc)

    (every 2 (monitor beat dur lc) )
    
    (callback-at dur 'lp1 
        dur (1+ lc))))

(lp1 (*metro* 'get-beat 1) 1 1)
```

See also

- [every](https://extempore.michelepasin.org/def/every-2.html)


## 9. Loop with `rect` downbeats

Using a `rectr` function to oscillate downbeats between two states only. 

Note: `dur` is defined internally here, to make it easier to update the snippet at runtime.

```scheme
(define lp1
  (lambda (beat)
    (let ((dur 1/16)
          (t (rectr 1/2 1 1/16 )))

      (at t 0
        (play 1 A2 60 t)
      )

    (callback-at dur 'lp1))))

(lp1 (*metro* 'get-beat 1))
```


## 10. Loop with 'ping pong' effect 

Shorten the loop cycle duration by a fixed amount to achieve a ping pong effect. Reset the cycle duration when it gets too short.

```scheme
(define lp1
  (lambda (beat pitch dur inst)

  (play inst pitch (+ 10 (* dur 100)) dur )

  (if> dur 1/32
      (callback-at dur 'lp1 pitch (- dur 1/32) inst)
      (callback-at 2 'lp1 pitch 1 inst))))

(lp1 (*metro* 'get-beat 1) A3 1 1)
```

## 11. Loop with diatonic chord progressions

Generates chords variations based on diatonic changes. 

```scheme
(define lp1
  (lambda (beat degree)
    (let ((dur 8))

      (for-each (lambda (p)
        (play 1 p 30 dur))
      (mkchordiatonicr 36 '- degree 3 70))

    (callback-at dur 'lp1
        (oneof (rest (assoc degree
                      '((i iv)
                        (iv i)
                      ))))))))

(lp1 (*metro* 'get-beat 8) 'i)
```

See also

- [What are diatonic chords?](https://www.studybass.com/lessons/harmony/intro-to-diatonic-chords/)
- [Diatonic chords in major](https://musictheory.pugetsound.edu/mt21c/DiatonicChordsInMajor.html)
- [mkchorddiatonic](https://extempore.michelepasin.org/def/mkchordiatonic.html)



