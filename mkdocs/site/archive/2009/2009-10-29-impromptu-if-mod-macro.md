---
template: blog.html
author: Michele Pasin
title: "Impromptu: If-mod macro"
date: 2009-10-29
categories: 
  - "computermusic"
tags: 
  - "impromptu"
  - "macro"
  - "scheme"
---

Hey there - this morning I checked out a nice [screencast by Ben Swift](http://www.vimeo.com/7196155) and was struck by the _if-mod_ construct he's using. It's a really useful shortcut that saves you from writing a few (possibly distracting) parenthesis, so I tried to recreate it myself.

## Implementing `if-mod`

To recap.. normally with [Impromptu](http://impromptu.moso.com.au/) if you want to play notes at some specific time expressed in beats with you'd have to **set up a metronome** first \[have a look [here](http://impromptu.moso.com.au/tutorials/making_music/Beat%20%26%20Tempo.html) for more info about how to use \*metro\*\] and then **check for the right beat** using the _modulo_ function. 

For example, something like this will play a central C every first beat of a 4/4 measure:

```scheme

(define *metro* (make-metro 100))

(define test
   (lambda (beat)
      (if (equal? (modulo beat 4) 0)
          (play dls 60 60 3))
      (callback (*metro* (+ beat (* 1/2 1/4))) 'test (+ beat 1/4))))

(test (*metro* 'get-beat 4))
```

Another way of doing this is by using _case_. Same approach, but probably faster to code, as it lets you specify 'multiple beats' very easily:

```scheme

(define test2
   (lambda (beat)
      (case (modulo beat 4)
            ((0)
             (play dls 60 60 3))
            ((2 5/2)
             (play dls 67 60 1/2)))
      (callback (*metro* (+ beat (* 1/2 1/4))) 'test2 (+ beat 1/4))))

(test2 (*metro* 'get-beat 4))
```

Still quite a few parenthesis though... which, especially when playing live, might mean more chances to mess up! So when I saw Ben's video I realized that a **macro** usable to facilitate the creation of _case/modulo_ expressions would be quite useful.. Here is how it can be done:

```scheme

(define-macro (if-mod x y args)
   `(for-each (lambda (step)
                 (if (equal? (modulo beat ,x) step)
                     ,args))
              (if (list? ,y)
                  ,y
                  (list ,y))))
```

Now, by using the if-mod macro we've just created we can re-write the second example above much more concisely:

```scheme

(define test2-new
   (lambda (beat)
      (if-mod 4 0 (play dls 60 60 3))
      (if-mod 4 '(2 5/2) (play dls 67 60 1/2))
      (callback (*metro* (+ beat (* 1/2 1/4))) 'test2-new (+ beat 1/4))))

(test2-new (*metro* 'get-beat 4))
```

That's all! Notice also that the _if-mod_ construct can take either a list of beats or a single one.
