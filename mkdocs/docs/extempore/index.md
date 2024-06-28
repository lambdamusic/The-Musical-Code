# About

!!! warning
    Page under construction

!!! note "Note"
    [Extempore](https://extemporelang.github.io/) is a programming language for musical livecoding and algorithmic composition. If you're new to Extempore, [YouTube](https://www.youtube.com/results?search_query=extempore+livecoding) has many videos that show it in action.


## Extempore Extensions

The [Extempore Extensions](https://github.com/lambdamusic/extempore-extensions) repo contains a bunch of (mainly MIDI) scheme extensions that I developed in order to create Extempore musical algorithms more efficiently and more naturally. 




# Extempore links

- [Extempore project](https://github.com/digego/extempore)
- [docs ben swift](http://benswift.me/2012/09/26/interacting-with-the-extempore-compiler/)
- [docs official](https://extemporelang.github.io/)
- [My repo](https://github.com/lambdamusic/xtm-hacking)
- [vscode editor](https://github.com/extemporelang/vscode-extempore)

see old notes in [Keep](https://keep.google.com/u/0/#LIST/1AWbHbR8F93f1Iz1dsKdzPo07aJL6nSjxdIoyDgDEpVoO4NI4Dq5wWMU0xmzhtak) 



# Installing Extempore

1. Install [latest release](https://github.com/digego/extempore/releases)
2. Extract and open (some shortcuts available in bash_profile)
3. install vscode extension by pulling shared settings from gist
4. set up keybindings eg for VsCode


## Installation errors


January 4, 2021: Libportmidi error on workmac, after installing https://github.com/digego/extempore/releases/tag/v0.8.7 

```bash
Evaluating expression: (sys:load "/Users/michele.pasin/Dropbox/code/extempore/xtm-hacking/init-extempore/LOAD_ALL.xtm")

Loading * "libs/core/pc_ivl.xtm" *
Loading * "libs/external/portmidi.xtm" *
Loading xtmbase library... done in 1.731826 seconds
Loading xtmportmidi library... Bad: dlopen(./libs/platform-shlibs/libportmidi.dylib, 9): no suitable image found.  Did find:
	./libs/platform-shlibs/libportmidi.dylib: code signature in (./libs/platform-shlibs/libportmidi.dylib) not valid for use in process using Library Validation: library load disallowed by system policy
Error: could not open  dynamic library
^C
Received interrupt signal (SIGINT), exiting Extempore...
```

FIX:  
* open up folder in finder libs/platform-shlibs
* right click open in OSx for all executables  

