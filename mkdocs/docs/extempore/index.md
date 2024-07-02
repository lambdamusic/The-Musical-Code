# About

!!! warning
    Page under construction

!!! note "Note"
    [Extempore](https://extemporelang.github.io/) is a programming language for musical livecoding and algorithmic composition. If you're new to Extempore, [YouTube](https://www.youtube.com/results?search_query=extempore+livecoding) has many videos that show it in action.

## Getting started with Extempore

Start from here

- [Extempore Homepage](https://extemporelang.github.io/)
- [GitHub Homepage](https://github.com/digego/extempore)
- [Mailing List Archives](https://groups.google.com/g/extemporelang)
- [VSCode plugin](https://github.com/extemporelang/vscode-extempore)

Other resources

- [Ben's livecoding tricks](https://benswift.me/blog/2021/04/23/a-short-list-of-extempore-livecoding-tricks/)
- My own [Extempore Extensions Github repo](https://github.com/lambdamusic/extempore-extensions) contains a bunch of (mainly MIDI) scheme extensions that I developed in order to create Extempore musical algorithms more efficiently and more naturally. 


## Installing Extempore

!!! warning
    WIP

1. Install [latest release](https://github.com/digego/extempore/releases)
2. Extract and open (some shortcuts available in bash_profile)
3. Install VSCode extension by pulling shared settings from gist
4. Set up keybindings eg for VsCode


### Installation errors


**January 4, 2021** Libportmidi error on workmac, after installing <https://github.com/digego/extempore/releases/tag/v0.8.7> 

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

- open up folder in finder libs/platform-shlibs
- right click open in OSx for all executables  

