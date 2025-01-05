---
author: Michele Pasin
title: "2011-02-07: What is the reaper time in Impromptu?"
date: 2011-02-07
categories: 
  - "computermusic"
tags: 
  - "impromptu"
  - "latency"
  - "reaper"
  - "settings"
---

I got this info while reading Kontakt 4 documentation, and I thought it was useful to pass it on. It helps understanding the significance of the 'reaper time' setting in Impromptu, which I often playing around with without really getting it... (check Reaper stuff on IM mailing list).

[Kontakt 4](https://www.soundonsound.com/reviews/native-instruments-kontakt-4) is an aaward winning sampler from Native Instrument; I was just going through the docs the other day to figure out what it does or doesn't do and in the section that explain the various ettings parameters I found the description of the **'latency optimization'** very useful [(2.1.2 Latency Optimization \[KONTAKT 4 Getting Started – page 11 - get the pdf of the manual here)](https://www.native-instruments.com/fileadmin/ni_media/downloads/manuals/KONTAKT_PLAYER_4_Getting_Started_English.pdf).

The Latency slider controls the size of the playback buffer.

And here is the explanation of that setting:

> The load that typical digital audio calculations generate on your processor is often not constant and predictable; parameter changes, additional voices or other processes can all cause mo- mentary peaks in the load, which can result in drop-outs or other audio artifacts if not properly compensated for. That is why audio programs do not send the audio signals they generate directly to the hardware, but write them to a short buffer in memory instead, whose contents are in turn being sent to the actual hardware. 
> 
> This concept allows the program to bridge short irregularities in the stream calculation and thus be more resistant to processing peaks. Of course, this “safety net” comes at a price–the buffering causes a delay, known as **latency**, between the triggering of a note and the actual sound. This delay gets longer with increas- ing buffer sizes. Hence, it’s vital to tune the buffer size in order to find a good compromise between latency and playback reliability. The optimal value depends on such diverse factors as your CPU, memory and hard disk access times, your audio hardware and drivers, and your operating system environment. 
> 
> In order to find the optimal buffer size for your system, we recommend that you begin by setting the Latency slider described in the previous section to a healthy middle value between 384 and 512 samples, then gradually decrease the value during your normal work. When you begin to notice drop-outs, increase the buffer again by a small amount. Generally, it’s a good idea to have as few other applications as possible running in the back- ground when working with audio software. Also, if you can’t get below a certain buffer size without getting drop-outs, consult the documentation of your audio hardware to find out whether you can access it via an alternate driver architecture, as some architectures allow more efficient low-level access to the hardware than others.
