---
template: blog.html
author: Michele Pasin
title: "Enabling web-audio in Chrome"
date: 2011-06-19
categories: 
  - "computermusic"
tags: 
  - "audio"
  - "chrome"
  - "html5"
  - "web"
---

I haven't realized that Chrome has a whole bunch of invisible **experimental settings** that you can turn on just by going to "`about:flags`".

[](http://farm3.static.flickr.com/2534/5850209770_0f4d19240c.jpg)[![Chrome about:flags options view](/img/5850209770_0f4d19240c.jpg)](http://www.flickr.com/photos/76186999@N00/5850209770 "View 'Chrome about:flags options view' on Flickr.com")

Some of them will open up the musical capabilities of html5, which are pretty cool. Example, once you switch on the '**web-audio**' setting on Chrome, if you use a suitable musical musical library you could play a note just by issuing these javascript commands:

```

var n = Note.fromLatin('A4'); 

var freq = n.frequency(); // returns 440 
var name = n.latin(); // returns "A" 
var octave = n.octave(); // returns 4
```

The full example (with sound, if you've turned on the Web Audio setting as mentioned above) can be seen here: [musicjs demo](http://code.gregjopa.com/javascript/audio/musicjs/demo/).

More info about web audio and related stuff can be found on this blog post: [http://pixelist.info/web-audio-it-is-finally-almost-here/](http://pixelist.info/web-audio-it-is-finally-almost-here/)
