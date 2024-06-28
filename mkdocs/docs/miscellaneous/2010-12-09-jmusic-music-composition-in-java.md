---
author: Michele Pasin
title: "JMusic: music composition in Java"
date: 2010-12-09
categories: 
  - "computermusic"
tags: 
  - "composition"
  - "java"
  - "progression"
  - "tutorials"
---

> **jMusic** is a project designed to provide composers and software developers with a library of compositional and audio processing tools. It provides a solid framework for computer-assisted composition in Java™, and is also used for generative music, instrument building, interactive performance, and music analysis.

I have no intention to leave Scheme and Impromptu, but when I run into [jMusic](http://jmusic.ci.qut.edu.au/) the other day the thing that struck me is the extensive [tutorial](http://jmusic.ci.qut.edu.au/jmtutorial/t1.html) available on that website (also the [references](http://jmusic.ci.qut.edu.au/ReferencesLinks.html) section is worth checking out).

I think I'm going to start re-doing all of those exercises with Impromptu, as a learning exercise (btw it marvels me that there's no link to this site on the Impromptu one, given that Andrew Sorensen, the author of impromptu, was working on jMusic too)..

In particular there are various interesting sections that focus on how to represent algorithmically classic harmonic progressions. For example, the **[Chords in the cycle of fifths](http://jmusic.ci.qut.edu.au/jmtutorial/Chords.html)** [tutorial.](http://jmusic.ci.qut.edu.au/jmtutorial/Chords.html)

> This example plays a progression of dominate seventh chords each a fifth away from the previous chord. In this way each of the 12 notes of the chromatic scale are used once as the root of a chord. This chord progression is common in western musical styles from Baroque to Jazz, and is often called the Cycle of Fifths.

The musical result is beautiful; here's how I implemented it in scheme via Impromptu:

```lisp
(define progression  
   '((0 4 \-2 \-5) (\-7) (0 4 7 10) (5)))  
  
(define loop  
   (lambda (beat note)   
      (print note)  
      (let ((dur  (random '(1 2 4 1/2))))  
         (begin   
          (for-each (lambda (x)  
                       (play dls x 90 dur))  
                     (map (lambda(x) (+ x note)) (list-ref progression 0)))   
          (set! note (+ note (car (list-ref progression 1))))  
          (for-each (lambda (x)  
                       (play (/ dur 2) dls x 90 dur))  
                     (map (lambda(x) (+ x note)) (list-ref progression 2)))   
          (set! note (+ note (car (list-ref progression 3)))))                  
         (if (\> note 50)  
             (callback (\*metro\* (+ beat (\* 1/2 dur))) 'loop (+ beat dur) note)  
             (for-each (lambda (x)  
                          (play (eval dur) dls x 90 dur))  
                       (pc:make\-chord\-fixed note  4 '(0 4 7 14)))  
             ))))  
  
(loop (\*metro\* 'get\-beat) 50)
```
