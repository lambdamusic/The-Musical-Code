---
template: blog.html
author: Michele Pasin
title: "Using Impromptu to visualize RSS feeds"
date: 2011-12-21
categories: 
  - "computermusic"
tags: 
  - "canvas"
  - "news"
  - "rss"
  - "visualization"
  - "xml"
---

Some time ago I've been experimenting with the processing and display of [RSS feeds](http://www.google.co.uk/url?sa=t&rct=j&q=rss%20feed&source=web&cd=1&ved=0CD0QFjAA&url=http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FRSS&ei=K9jxTtyyMY-K4gSwibHBAQ&usg=AFQjCNEdBSkFc9gzQ_IRDoz4mZzyuZwfbw) within [Impromptu](http://impromptu.moso.com.au/), and as a result I built a small app that retrieves the news feed from [The Guardian](http://www.guardian.co.uk/) online and displays on a canvas. I've had a bit of free time these days, so last night I thought it was time to polish it a little and make it available on this blog (who knows maybe someone else will use it as starting point for another project).

[![Visualizing rss feeds with Impromptu](/img/6549002895_2b42b95cef.jpg)](http://www.flickr.com/photos/mikele/6549002895/ "Visualizing rss feeds with Impromptu by MagIcReBirth, on Flickr")

> There're a thousand improvements that could be done to it still, but the core of the application is there: I packaged it as a standalone app that you can [download here](http://www.box.com/s/oprvyybridp0gtij8j5d). (use the 'show package contents' Finder command to see the source code).

The application relies on a bunch of XML processing functions that I found within Impromptu 'examples' folder (specifically, it's the example named [35\_objc\_xml\_lib](http://impromptu.moso.com.au/examples_2.5/35_objc_xml_lib.html)). I pruned that a bit so to fit my purposes and renamed it xml\_lib.scm.

By using that, I created a function that extracts title and url info from the guardian feed:


```scheme
(load "xml_lib.scm")
(define feedurl "http://feeds.guardian.co.uk/theguardian/world/rss")

;;
;; loads the feed and extracts title and url
;;

(define get-articles-online
     (lambda ()
        (let* ((out '())
               (feed (xml:load-url feedurl))
               (titles (objc:nsarray->list (xml:xpath (xml:get-root-node feed)
                                                "channel/item/title/text()")))
               (urls (objc:nsarray->list (xml:xpath (xml:get-root-node feed)
                                                "channel/item/link/text()"))))                                                 
           (for-each (lambda (x y)
                        (let ((xx (objc:nsstring->string x))
                              (yy (objc:nsstring->string y)))
                           (set! out (append out (list (list xx yy))))))
                titles urls)
           out)))
```

Some feed titles are a bit longish, so I added a utility function formattext that wraps the titles' text if they exceed a predefined length.

```scheme
(define formattext 
   (lambda (maxlength txt posx posy)
      (let ((l (string-length txt)))      
         (if (> l maxlength)
             (let loop ((i 0)
                        (j maxlength) ;; comparison value: it decreases at each recursion (except the first one) 
                        (topvalue maxlength)) ;; komodo value : must be equal to j at the beginning
                (if (equal? (- topvalue i) j) ;; the first time
                    (loop (+ i 1) j topvalue)
                    (begin   ;(print (substring txt (- topvalue i) j))
                             (if (string=? (substring txt (- topvalue i) j) " ")
                                 (string-append (substring txt 0 (- topvalue i)) 
                                                "n" 
                                                (substring txt (- topvalue i) (string-length txt)))
                                 (if (< i topvalue) ;;avoid negative indexes in substring
                                     (loop (+ i 1) (- j 1) topvalue))))))
             txt))))
```

And here's the **main loop**: it goes through all the feed items at a predefined speed, and displays it on the canvas using a cosine oscillator to vary the colours a bit. At the end of it I'm also updating 3 global variables that are used for the mouse-click-capturing routine.

```scheme
(define displayloop
   (lambda (beat feeds) 
      (let* ((dur 5)
             (posx  (random 0 (- *canvas_max_x* 350)))
             (posy  (random 10 (- *canvas_max_y* 150)))
             (txt (formattext 40 (car (car feeds)) posx posy))
             (dim ;(+ (length feeds) 10))                  
                  (if (= (length feeds) 29)
                      60  ;; if it's the first element of the feed list make it bigger
                      (random 25 50)))
             (fill (if (= (length feeds) 29)
                         '(1 0 (random) 1)  ;; if it's the first element of the feed list make it reddish
                         (list (random) 1 (random) 1)))
             (style (gfx:make-text-style "Arial" dim fill)))
         (gfx:clear-canvas (*metro* beat) *canvas* (list (cosr .5 .6 .001) 0 (cosr .5 .6 .001) .5 ))
         (gfx:draw-text (*metro* beat) *canvas* txt style (list posx posy))
         (set! *pos_x* posx)
         (set! *pos_y* posy)
         (set! *current_url* (cadr (car feeds)))
     (callback (*metro* (+ beat (* 1/2 dur))) 'displayloop (+ beat dur)
               (if-cdr-notnull feeds 
                               (get-articles-online))))))
```

In order to capture the clicks on the feed titles I simply create a rectangle path based on the x,y coordinates randomly assigned when displaying the title on the canvas. These coordinates are stored in global variables so that they can be updated constantly.

```scheme
(io:register-mouse-events *canvas*)
(define io:mouse-down
   (lambda (x y)
      (print x y)
      (when (gfx:point-in-path? (gfx:make-rectangle *pos_x* *pos_y* 200 200) x y )
            (util:open-url *current_url*))))
```

Finally, the util:open-url opens up a url string in your browser (I've already talked about it [here](http://www.michelepasin.org/blog/2010/02/15/impromptu-function-to-access-wiki-docs-from-the-editor/)).

You can see all of this code in action by [downloading the app](http://www.box.com/s/oprvyybridp0gtij8j5d) and taking a look its contents (all the files are under Contents/Resources/app).

[![Visualizing rss feeds with Impromptu](/img/6549002521_9b39fb2120.jpg)](http://www.flickr.com/photos/mikele/6549002521/ "Visualizing rss feeds with Impromptu by MagIcReBirth, on Flickr")

### If I had the time…

Some other things it'd be nice to do:

- Creating a routine that makes the **transitions** among feed items **less abrupt**, maybe by using canvas layers.
- Refining the **clicking events** creation: now you can click only on the most recent title; moreover the clicking event handler is updated too quickly, thus unless you click on the titles as soon as it appears you won't be able to trigger the open-url action.
- Refining the **xml-tree parsing** function, which now is very very minimal. We could extract news entries description and other stuff that can make the app more informative.
- Adding some **background music** to it.

