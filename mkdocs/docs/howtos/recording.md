



# Transform to mp3 command line

`> ffmpeg -i GranPianoSetup\ 2020-08-14.aif GranPianoSetup\ 2020-08-14.mp3`

From [stackexchange](https://apple.stackexchange.com/questions/26099/is-there-a-way-to-convert-audio-files-in-mac-os-x-or-the-command-line-without-us) - 2020-08-14



#  Fx send with Behringer Mixer

November 2, 2020
Mixer review https://www.youtube.com/watch?v=K2x17AN7glE
Plugin guide https://www.youtube.com/watch?v=MOG6VIZgDAc

From [this forum](https://homerecording.com/bbs/general-discussions/newbies/xenyx-1002-fx-send-what-does-do-can-i-use-external-effects-401885/)


```
The way you can do it is like this:

1 Connect drum machine to any of the stereo channels (5/6, 7/8 or 9/10).
2 Connect a lead from the Xenyx FX send output to the Virtualizer.
3 Connect a lead from the output of the virtualizer to any remaing free channel on the Xenyx.

The FX knob on the channel you have the drum machine in sets the level of signal to go to the virtualizer. The FX send knob under the phantom power switch is the master volume for this. In the Virtualizer you will have to adjust the reverb setting so that you only get wet coming back.

The fader on the channel you have the virtualizer plugged into controls the amount of reverb coming back.

Plugging the drum machine into the RCA inputs is ok, but you cannot apply FX to this.

Alternatively, you can do your other option, i.e. plug drum machine into virtualizer, then plug virtualizer into one of the Xenyx channels. In this case, you would have to adjust the reverb setting in the virtualizer to get a desired balance of wet and dry.
```


- [Issues with feedback](https://www.gearslutz.com/board/so-much-gear-so-little-time/842477-bizzarre-fx-return-issue.html) 
- [Nice Q&A](https://sound.stackexchange.com/questions/26175/what-is-the-purpose-of-an-aux-return)

> an Aux Return is a level-control-only input that generally feeds directly into the Mix Bus (rather than using up a fully-featured channel), and has no aux send from it (automatically preventing feedback through the device).

- [Mixer Quickstart Guide](https://www.sweetwater.com/sweetcare/articles/mixer-quickstart-guide/)




# Final Cut settings

* 1080 or 4k seems to have the same audio quality 
* 4k seems to occupy less space, unclear why
* originals in FinalCut folder, at some point can get rid of them 
* the export in iTunes folder seems the most interesting thing to keep 



# Ripping DVDs

Environment: Mac OSX Monterey 12.3.1 
Apple Mac Mini M1 2020

1. Check out the [How-to guide on Macworkd](https://www.macworld.com/article/671971/how-to-rip-a-dvd-or-blu-ray-disc-to-mac.html)
2. Download open-source software [Handbrake](https://handbrake.fr/downloads.php)
3. Install [libdvdcss](https://www.videolan.org/developers/libdvdcss.html)
	1. From the terminal `brew install libdvdcss` ([more info here](https://www.macxdvd.com/mac-dvd-video-converter-how-to/libdvdcss-mac-download.htm))

