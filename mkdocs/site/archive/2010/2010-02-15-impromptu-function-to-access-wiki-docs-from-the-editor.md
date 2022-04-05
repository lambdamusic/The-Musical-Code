---
template: blog.html
author: Michele Pasin
title: "Impromptu: access the Wiki docs from the editor"
date: 2010-02-15
categories: 
  - "computermusic"
tags: 
  - "impromptu"
  - "scheme"
  - "url"
---

 When you're [Impromptu](http://impromptu.moso.com.au/index.html)\-ing but **don't know the meaning or syntax of a function**, the usual thing to do is calling `(help function-name)` to get some help about that function, or `(help function-name #t)` if you want to see also the examples associated with it. The help text gets displayed in the log view, so that you can then copy/paste what you need from there. Quite useful, but nonetheless I always find myself **fighting with the log window**: too small, hidden away by other canvases, or not readable anymore cause after calling the help function I've evaluated other stuff that has moved up the much needed help-text.

Since a couple of months ago [Impromptu has a wiki too](http://moso.com.au/wiki/index.php?title=Main_Page) - so I thought, it'd be nice to see a function's help in a browser window, and possibly contribute to its explanation too..

So, that's the rationale for this little script. **By calling 'wiki' you can open up a web browser at the relevant Impromptu-wiki page**.. as simple as that. [![](http://magicrebirth.webfactional.com/blog/wp-content/uploads/2010/02/picture-21.png?w=300 "Picture 2")](http://magicrebirth.webfactional.com/blog/wp-content/uploads/2010/02/picture-21.png) >>>

First off, we need a couple of utility functions that are not included in Impromptu by default, for better manipulating strings, lists and webpages (UPDATE 9-Nov2010: some of this symbols have been included in Improptu 2.5, so I prefixed the one below with the _utils:_ namespace):


```scheme
;;;;;;;
;; utilities
;;;;;;;

;; (utils:list-flatten '(9 9 (9 9 9 ))))  = (9 9 9 9 9)
(define utils:list-flatten
   (lambda (l)
      (cond ((null? l)
             '())
            ((atom? l)
             (list l))
            (#t (append (utils:list-flatten  (car l)) (utils:list-flatten  (cdr l)))))))

;; returns a char from a string of length 1, or a list of chars from a longer string
(define utils:char
   (lambda (string_char)
      (if (string? string_char)
          (if (> (string-length string_char) 0)
              (if (> (string-length string_char) 1)
                  (string->list string_char)
                  (car (string->list string_char))))
          (print 'please 'enter 'a 'string))))

;; matches a single character in a string, and replaces it
(define utils:string-replace
   (lambda (s match replacement)
      (let ((ll (string->list s))
            (match1 (utils:char match))
            (replacement1 (utils:char replacement)))
         (if (= (string-length match) 1)
             (let ((z (map (lambda (x)
                              (if (equal? x match1)
                                  replacement1
                                  x))
                           ll)))
                (list->string (utils:list-flatten z)))
                ;z)
             (print "i can match only single characters for now")))))

;; makes a string upper case
(define utils:string-capitalize
   (lambda (s)
      (string-append (string (char-upcase (string-ref s 0))) (substring s 1 (string-length s)))))

;; open-url: calls the default mac browser with a url argument 
;; disclaimer: I'm not an objc programmer... found an example at 
;; [http://macosx.com/forums/software-programming-web-scripting/18422-how-do-i-launch-url-using-cocoa-objective-c.html](http://macosx.com/forums/software-programming-web-scripting/18422-how-do-i-launch-url-using-cocoa-objective-c.html)
(define utils:open-url
   (lambda (urlstring)
      (let ((urlobj (objc:call "NSURL" "URLWithString:" urlstring))
            (workspace (objc:call "NSWorkspace" "sharedWorkspace")))
         (objc:call workspace "openURL:" urlobj))))
```
 

Finally, the functions for opening the wiki page:


```scheme
;;;;;;;;;;
;; wiki url caller
;; e.g. (wiki objc:from-address) => goes to http://moso.com.au/wiki/index.php?title=Objc:from-address
;;;;;;;;;;

;; wiki-escape: composes the url so that it matches the ones of the online wiki 
(define wikiescape
   (lambda (funname)
      (for-each (lambda (x)
                   (set! funname (utils:string-replace funname (car x) (cadr x))))
                '(("+" "%2B")
                  ("=" "%3D")
                  ("<" "lessthan")
                  (">" "greaterthan")
                  ("*" "%2A")
                  ("?" "%3F")
                  ("!" "%21")
                  ))
      (utils:string-capitalize funname)))

(define wiki-inner
   (lambda (funname)
      (let* ((urlbase "[http://moso.com.au/wiki/index.php?title=](http://moso.com.au/wiki/index.php?title=)")
             (newname (wikiescape funname))
             (url (string-append urlbase newname)))
         (utils:open-url url))))

;; macro wrapper and main function that gets called 
(define-macro (wiki name)
   `(wiki-inner (sexpr->string (quote ,name))))
```
 

That's it: load all of this code (or put it in a single file and load it at startup time) and you've got the wiki procedure available!
