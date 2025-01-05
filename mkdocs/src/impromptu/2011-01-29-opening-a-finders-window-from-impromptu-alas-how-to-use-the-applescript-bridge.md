---
author: Michele Pasin
title: "2011-01-29: Opening a Finder's window from Impromptu (alas how to use the applescript bridge..)"
date: 2011-01-29
categories: 
  - "computermusic"
tags: 
  - "applescript"
  - "finder"
  - "impromptu"
  - "objc"
  - "programming"
  - "scheme"
---

Imagine you've got a bunch of audio samples you want to load up while livecoding with [Impromptu](http://impromptu.moso.com.au/) but you can't remember exactly their names - it'd be handy to be able to open up the corresponding Finder window directly from scheme, without too much clicking around. Do-able or not?

I spent some time trying to figure this out, and the answer is yes! Quite a nice learning experience... although it came with a **surprise** at the end.

Originally I thought, let's do it via impromptu's [ObjC bridge](http://moso.com.au/wiki/index.php?title=ObjC_Functions). I don't know much about ObjC but after a bit of googling it seemed evident that the [quickest way to accomplish this](http://stackoverflow.com/questions/1446814/open-a-terminal-window-to-a-specified-folder-from-a-cocoa-app) is by writing ObjC code that, in turns, runs a simple [applescript](http://www.macosxautomation.com/applescript/) command that opens a window:

```c
[NSString](http://developer.apple.com/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/) \*s \= \[[NSString](http://developer.apple.com/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/) stringWithFormat:  
     @"tell application "Terminal" to do script "cd %@"", folderPath];  
  
[NSAppleScript](http://developer.apple.com/documentation/Cocoa/Reference/Foundation/Classes/NSAppleScript_Class/) \*as \= \[\[[NSAppleScript](http://developer.apple.com/documentation/Cocoa/Reference/Foundation/Classes/NSAppleScript_Class/) alloc\] initWithSource: s\];  
[as executeAndReturnError:nil];
```

So I translated the bottom part of the code above into impromptu/scheme:

```scheme
(define run_applescript  
   (lambda (script)  
      (objc:call (objc:call (objc:call "NSAppleScript" "alloc")  
                            "initWithSource:"  
                            script)  
                 "executeAndReturnError:" )))

That is a generic script-running function, that is, you can pass any script and it'll run it, eg:

(define script0 "  
   tell application "Finder" to open folder "Macintosh HD:Users"  
   tell application "Finder" to activate")  
  
  
(define script1 "  
   tell application "Terminal" to do script "cd ~; open ."")  
  
  
(define script2 "  
                tell application "System Events"n  
                tell dock preferencesn  
                set properties to {autohide:false}n  
                end telln  
                end tell")  
  
;; finally, let's choose randomly one of the scripts above and run it  
(run_applescript (random '(script0 script1 script2)))
```

Now, back to the original problem: in order to open a Finder's window at a specified location we need to pass the location variable to our function _run\_applescript_; also, we want to be able to pass unix path expressions (eg '/Users/mike/music/'), so we've got to transform that path syntax into the semicolon-delimited macintosh syntax ("Macintosh HD:Users:mike:music") needed by the applescript function we're using. That's easily done with _string-replace_, so here we go:

```scheme
(define open_finder_at  
   (lambda (location)  
      (let* ((llocation (string-replace location "/" ":"))  
              (script (string-append "tell application "Finder" to activate open folder "Macintosh HD" llocation """)))  
         (objc:call (objc:call (objc:call "NSAppleScript" "alloc")  
                               "initWithSource:"  
                               script)  
                    "executeAndReturnError:" ))))  
  
  
(open_finder_at "/Users/me/")
```

That's pretty much it really... now we can easily open OsX Finder's windows from within Impromptu.

But as I said above, there's a surprise: after getting this far I thought I'd search impromptu's mailing list for more examples of [obj:call](http://moso.com.au/wiki/index.php?title=ObjC_Functions) .... and guess what, there's already a system function that runs applescripts, it's called [sys:run-applescript](http://moso.com.au/wiki/index.php?title=Sys:run-applescript) !

Too bad, it's been a rewarding learning experience anyways...
