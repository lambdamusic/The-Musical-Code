---
title: "Callback-at"
date: "2024-04-02"
categories: 
  - "functions"
---

# Callback-at

A more terse version of the `callback` function  with metro/beat implied.

The built-in [callback function](https://extempore.michelepasin.org/def/callback.html) is the main mechanism to build temporal recursions in the Extempore language.

## Goal

Changing

```scheme
;; from 
(callback (*metro* (+ beat (* 1/2 dur)))
        'main (+ beat dur))

;; to
(callback-at dur 'main )
```

or, if you have more arguments:

```scheme
;; from
(callback (*metro* (+ beat (* 1/2 dur)))
        'main (+ beat dur) dur plist)

;; to  
(callback-at dur 'main dur plist )
```

## Implementation

```scheme
;; first arg is always the time delay for the recursion, then the function
(impc:aot:do-or-emit
    (define-macro (callback-at dur fun . args)
      `(callback (*metro* (+ beat (* 1/2 ,dur)))
            (eval (quote ,fun)) (+ beat ,dur) ,@args)))
```

The only **requirement** is to have the `beat` and `*metro*` symbols defined. Note: [*metro*](https://github.com/digego/extempore/blob/v0.8.9/runtime/scheme.xtm) is available by default with the standard Extempore library.


## Example

```scheme
;; basically, you can simply omit beat
(let ((beat (*metro* 'get-beat)))   
    (callback-at 1 'println 1))


;; let's play some music 
(define pinco
  (lambda (beat)
    (let ((dur (random 1 3)))
        (play 1 (random 60 80) 90 dur)
      (callback-at dur 'pinco ))))

(pinco (*metro* 'get-beat 1))
```


## See also

* Original [callback function](https://extempore.michelepasin.org/def/callback.html)
* Implementation of [make-metro function](https://github.com/digego/extempore/blob/v0.8.9/runtime/scheme.xtm)
* [Extempore language](https://extemporelang.github.io/) homepage

## Changelog

* 2024-04-21: page created