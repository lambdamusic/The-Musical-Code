---
author: Michele Pasin
title: "2011-03-29: An alternative to the 'play' macro: 'iplay' and 'with-instrument'"
date: 2011-03-29
categories: 
  - "computermusic"
tags: 
  - "impromptu"
  - "macro"
  - "play"
---

The other day I was thinking: when I use the [play macro in Impromptu](http://moso.com.au/wiki/index.php?title=Play)  ([video tutorial](http://impromptu.moso.com.au/resources.html#faq16)), in my head it's already **obvious** what's the virtual instrument I want to play. So why do I have to specify that all the time? Wouldn't it be more natural just being able to say, for example, **get this instrument** and now **play this and that note with it**...

Let me clarify this with an example. Let's set up the standard Apple's DLS-synth audiounit and the metronome:

```scheme
(au:clear-graph)
(define dls     (au:make-node "aumu" "dls " "appl"))
(au:connect-node dls 0 *au:output-node* 0)
(au:update-graph)
(au:print-graph)
(define *metro* (make-metro 100))
```

Now imagine that we want to play some (dumb) melody with Apple's DLS. We can use the usual _play_ macro to achieve this quite easily (that's because above we set up the metronome, which is needed in order to use _play_ - check out the [docs](http://moso.com.au/wiki/index.php?title=Play) if this sounds odd to you).

Sequencing a bunch of notes is thus just a matter of sequencing _play_ macros:

```scheme
(define the-usual-play
   (lambda (beat) 
      (play dls 60 90 1)
      (play dls 64 90 1)
      (play 1/2 dls 72 90 1)
      (play 3/2 dls 67 90 1)
      (callback (*metro* (+ beat (\* 1/2 2))) 'the-usual-play (+ beat 2))))

(the-usual-play (*metro* 'get-beat 4))
```

**That's where I started getting nervous** (so to say). Having to write 'dls' each time I play a new note seemed to me redundant and illogical; I **know** that it's dls the instrument I want to play - I heard my mind screaming - why can't I focus on the music instead of making sure I type in the instrument name all the time?

### Taking advantage of Scheme, the self-modifying language

Luckily though we're using [Scheme](http://www.michelepasin.org/blog/2010/08/10/learning-resources-about-scheme/), which differently from most other computer languages allows you to change the language grammar as you like, thanks to [macros](http://en.wikipedia.org/wiki/Macro_(computer_science)). So here we go, we can create a new macro similar to _play_ that lets you omit the instrument you're playing. We'll call it _**iplay**_ (shortcut for instrument-play, not itunes :-)):

```scheme
(macro (iplay args)  
   (cond ((equal? (length (cdr args)) 3)
          `(let ((note ,(cadr args))
                 (vol ,(caddr args))
                 (dur ,(cadddr args))
                 )
              (play my-inst note vol dur)))
         ((equal? (length (cdr args)) 4)
          `(let ((offset ,(cadr args))
                 (note ,(caddr args))
                 (vol ,(cadddr args))
                 (dur ,(cadddr (cdr args))))               
           (play (eval offset) my-inst note vol dur)))
         (#t (print "Error: the function only accepts 3 or 4 argument"))))
```

Essentially what we're telling the interpreter here is that every time _iplay_ is used, the original _play_ should be called and the symbol _my-inst_ should be passed as the variable representing our instrument. Now we can modify the simple loop defined above like this:

```scheme
(define the-usual-play-modified
   (lambda (beat) 
      (let ((my-inst dls))
         (iplay 60 90 1)
         (iplay 64 90 1))
      (play 1/2 dls 72 90 1)
      (play 3/2 dls 67 90 1)
      (callback (*metro* (+ beat (\* 1/2 2))) 'the-usual-play-modified (+ beat 2))))

(the-usual-play-modified (*metro* 'get-beat 4))
```

If you run that, you'll see that this loop sounds exactly the same as the previous one, although the first two _play_ calls are now _**iplay**_ macro calls. The whole thing works because we introduced a local variable _my-inst_ and bound that to the dls audio instrument (created at the beginning). Notice that **the new macro _iplay_ knows nothing about what instrument is playing**: it's just using blindly the _my-inst_ variable, under the assumption that we've associated it to a valid audio instrument.

### Some more syntactic sugar

The only hassle now is that each time we want to use _iplay_ we are forced to use the _(let ((my-inst dls)).._ form. Typing this stuff doesn't feel very natural too. Rather, in my head, I tend to see things like this: get an instrument first, then play a bunch of notes with it.

So, let's create some syntactic sugar for the '_let_' form, by defining another macro, '_with-instrument_':

```scheme
(macro (with-instrument args)
   `(let ((my-inst ,(cadr args)))
       ,@(cddr args)))
```

As you can see, this macro doesn't do much: it just rephrases the _let_ form above in a way that is probably more natural to me (and to others too I believe..).

For example, now we can use _iplay_ like this:

```scheme
(define justatest
   (lambda (beat)      
      (with-instrument dls 
          (iplay 48 40 1)  ;; iplay with 3 args: pitch, vol and dur
          (iplay (random (list 1/2 1/4 1/8)) (random 60 80) 40 1))  ;; 4 arguments: offset
      (callback (*metro* (+ beat (\* 1/2 1))) 'justatest (+ beat 1))))

(justatest (*metro* 'get-beat 4))
```

Finally, **let's remember** that because of the way we defined _iplay_ above, we can pass it 3 or 4 arguments: in the first case, the macro assumes that we're providing a **pitch**, a **volume**, and a **duration**. In the second case instead the first argument is assumed to be an **offset** value (while the others remain unchanged).

The [original _play_ macro](http://moso.com.au/wiki/index.php?title=Play) can take another argument too: the **channel** (or midi port). I haven't included here cause I normally don't need it, but if you do I'm sure you can fiddle a bit with the code above and make it do whatever you want!

Conclusion: here is the code you need to evaluate within Impromptu if you want to use the with/iplay constructs (all the source code is also available on [BitBucket](https://bitbucket.org/magicrebirth/impromptu_public/src/tip/_libs/playau.scm)):

```scheme
(macro (with-instrument args)
   `(let ((my-inst ,(cadr args)))
       ,@(cddr args)))

(macro (iplay args)
   (cond ((equal? (length (cdr args)) 3)
          `(let ((note ,(cadr args))
                 (vol ,(caddr args))
                 (dur ,(cadddr args))
                 )
              ;(print inst beat note vol dur)
              (play my-inst note vol dur)))
         ((equal? (length (cdr args)) 4)
          `(let ((offset ,(cadr args))
                 (note ,(caddr args))
                 (vol ,(cadddr args))
                 (dur ,(cadddr (cdr args))))
           ;(print inst beat note vol dur)
           (play (eval offset) my-inst note vol dur)))
         (#t (print "Error: the function only accepts 3 or 4 argument"))))
```

### Finally.. a 'pastebin' function

Also, here is a pastebin function similar to [pb:cb](http://moso.com.au/wiki/index.php?title=Pb:cb) (check out this [video tutorial](http://impromptu.moso.com.au/resources.html#faq15) if you don't know what I'm talking about) that returns a template with the _with-instrument_ macro:

```scheme
(define pb:iplay (lambda (name dur inst) '()))  ;; fake function definition, useful for autocompletion!

;; macro wrapper for pb-iplay
(define-macro (pb:iplay name dur inst . args)
   \`(pb-iplay (sexpr->string (quote ,name)) 
              (sexpr->string (quote ,dur))
              (sexpr->string (quote ,inst))
              ,@(map (lambda (expr)
                        (sexpr->string expr))
                     args)))

(define pb-iplay
   (lambda (name dur inst . args)
      (let ((a (apply string-append (map (lambda (e) (string-append "n      " e)) args))))
         (sys:set-pasteboard
         (string-append 
"(define " name "
   (lambda (beat) 
      (with-instrument " inst "
          " a "
     (callback (\*metro\* (+ beat (\* 1/2 " dur "))) '" name " (+ beat " dur ")))))nn(" name " (\*metro\* 'get-beat 4))")))))

;;;;;;;;;;;;;;;;
;; call it like this: 
;(pb:iplay myloop 1/4 dls)
;;

;;;;;;;;;;;;;;;;;
;; returns: 
;;;;;;;;;;;;;;;;

;
;(define myloop
;   (lambda (beat) 
;      (with-instrument dls
;
;     (callback (\*metro\* (+ beat (\* 1/2 1/4))) 'myloop (+ beat 1/4)))))
;
;(myloop (\*metro\* 'get-beat 4))
```

