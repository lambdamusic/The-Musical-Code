# Quick start

!!! question "What is Extempore?"
    [Extempore](https://extemporelang.github.io/) is a programming language for musical livecoding and algorithmic composition. If you're new to Extempore, [YouTube](https://www.youtube.com/results?search_query=extempore+livecoding) has many videos that show it in action.

## Getting started with Extempore

### Main resources

- [Extempore Homepage](https://extemporelang.github.io/) and [GitHub project](https://github.com/digego/extempore): all you need to know about the Extempore language from its author Andrew Sorensen
- [Mailing List Archives](https://groups.google.com/g/extemporelang): questions and answers from the community
- [VSCode plugin](https://github.com/extemporelang/vscode-extempore): an extension for the popular code editor that makes it easier to interact with the Extempore server

### Other resources

- [Ben's livecoding tricks](https://benswift.me/blog/2021/04/23/a-short-list-of-extempore-livecoding-tricks/) give you a hint of how to make music with Extempore
- My own [Functions navigator](https://extempore.michelepasin.org/): a website that makes it easier to search and inspect Extempore's code base.

## Installing Extempore

!!! warning
    Section needs revision

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

