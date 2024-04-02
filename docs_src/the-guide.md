


# Screen size for youtube exporting

720p: 1280x720 pixels
https://influencermarketinghub.com/youtube-video-size/

If the video is pixelated or out of focus:
Export with a higher resolution EG 4K. This forces the YouTube optimiser to use the higher res compressor by default.


# Standard YouTube composition description

Title

`Many pianos - Study No 2 In B Minor  // Extempore Livecode Algorithmic Music`

Copy paste and edit in the video description:

```
Title: 
Many pianos - Study No 2 in B Minor 
Description:
Me having fun with various overlapping piano numerical patterns.

01:04 Music starts
02:59 Second line
04:35 Third line
06:04 Fourth line

---
Credits:
Livecoding software: Extempore 
https://extemporelang.github.io/
Sounds: Ableton Live
- syn1: Kontakt Pad: Lesotho 
- syn2: Spitfire Audio: Siren Songs - Gossip
- syn3: Zebralette: Lead

---
Author: @lambdamusic
Code: https://github.com/lambdamusic/The-Musical-Code/blob/main/works/TODO.xtm
```


# Youtube video management

- Help page about [creating a new channel](https://support.google.com/youtube/answer/1646861?hl=en-GB) 
- Channel switcher [add a new channel](https://www.youtube.com/channel_switcher) 
- My channel [The musical Code](https://www.youtube.com/channel/UCanqSICbxzRNEZGMlu8qfyw/)


# Rect

Rect produces a repetitive function that has the min value and the max value only. No intervals. 
The max value is the sum of base point and variation. Eg 1/4 + 3/4 (=1) in this example:

```scheme
(at (rectratio 1/4 3/4 1/16) 0 ;; cycle between two downbeat values
    (play piano3 
		(mkrel C3 (cosr (cosr 5 4 .02) (cosr 5 5 7/2)  1/39) 'm) ;; use intervals of C3
        (cosr 25 15 1) 1)
	)
```

This allows to produce cycled loops with two values only. 
Tip: operate the pitch cosr frequency to generate different notes eg. (cosr 5 5 1/2)

Make it more interesting by introducing a random offset to make it sounds more natural: 

```scheme
(at (rectratio 1/4 3/4 1/16) 0 
    (play (random '(1/4 1/8 0 0)) ;; random offset
		;; (cosratio 1/2 1/2 1/4) ;; cosr offset
		piano3 
		(mkrel C3 (cosr (cosr 5 4 .02) (cosr 5 5 7/2)  1/39) 'm) 
        (cosr 25 15 1) 1)
	)
```



# Ableton LIVE tips

2021-01-01: MIDI setup with Extempore 

MIDI Ports Input:
* set up a new IAC driver 
* set Track and Remove inputs to true
	* https://help.ableton.com/hc/en-us/articles/209774205-Live-s-MIDI-Ports-Explained
* ready to go! (route extempore midi to that) and don’t activate MIDI Output at all

* channels a 1-based in Live, but are 0-based in Extermpore!!! 

* optionally create a control surface script (midi mappings)
* https://help.ableton.com/hc/en-us/articles/209774285-Using-Control-Surfaces

PS Set only Input (not output) !!

Also:
[EXTERNAL CONTROLLERS infos](https://www.musictech.net/guides/buyers-guide/best-controllers-ableton-live/) 



# OSx Audio midi setup 

1. open up Audio Midi Setup app / Show Midi Studio
2. double click on IAC driver and add a new entry called Extempore BUS ([more info](http://www.macosaudio.com/forums/viewtopic.php?f=7&t=11776))
3. in LIVE make sure all INPUT sections in MIDI Sync / MIDI Ports are ON 




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




# Screencast with Quicktime + RecordIt plugin
July 7, 2021 

- [my blog](https://www.michelepasin.org/blog/2021/08/30/recordit-plugin/index.html)
- [QuickTime and ‘record it’ plugin](https://www.buildtoconnect.com/help/how-to-record-audio-on-your-mac)

1. Get plugin
2. On AudioMidi Setup, increase format to 96hz
	* Ensure it's done before opening LIVE
3. Set Quicktime to record screen, and get audio from RecordIt
4. Set Live (or DAW) to output audio to RecordIt 

DONE! 

=> It doesn't matter which device the Mac Menu has selected (headphones, etc)
=> Unclear what the 'Quicktime Audio Recording' device does -- TODO can we remove it? Seems to be a layer on top of RecordIt... but is it needed?? 



# Post Processing tips
March 31, 2022

Enhancing Audio: as often the audio I get from a screencast recording is rather weak. 

Steps using iMovie: 

1. Open movie in iMovie
2. Detach Audio
3. Enhance Volume in editor using line dragging
4. Enhance sound with menu: Music Settings > Equalizer > Music Enhance
5. Share > File 
	* Resolution: 720p 60 / 1080 p for large windows
	* Quality: High 
	* Compress: Faster 

For a 10 mins video, that gives me a `.mp4` file of ~250M 




# Screencast with Screenflick (legacy)
https://www.araelium.com/support/screenflick

*  When you start a recording with system audio turned on, Screenflick switches the system-wide default audio output device to the "Soundflower" virtual audio device, which Screenflick then uses as an input to record audio from. 
* Some programs unfortunately will play all audio over a specific output device determined when the application launched rather than always using the current system setting which can lead to problems like this.
* What needs to happen is the program playing audio needs to decide that it should play that audio to the Soundflower device, rather than your speakers. There are two ways this can happen.
 	1.	Launch the program which plays the audio after you start a Screenflick recording. (The system output device will be Soundflower and the program will therefore use it.)
 	2.	Before starting the program, go into System Preferences and change the system output audio device to "Soundflower (2ch)" manually, start the program which will play audio, and then start the recording in Screenflick when you're ready. (After the recording ends, don't forget to change the system output device back to your speakers.)
	[BEST]
	 3.	A third option which doesn't always exist, is that the program playing audio may have a preference setting for which audio device to play audio to. Check the program's preferences just in case. If it does have a setting, set it to "Soundflower (2ch)" while recording.

My own tips:
- FPS 15  
	- Seems to lead to less MIDI delays 
	- Frames not an issue cause it's just screen recording
Then **export** to Qtime
- Audio 128 Kbps
- All other options default
	- Changing framerate seem to have no effect 

