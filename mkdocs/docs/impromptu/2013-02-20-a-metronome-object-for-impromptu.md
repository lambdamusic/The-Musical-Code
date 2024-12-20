---
author: Michele Pasin
title: "2013-02-20: A metronome object for Impromptu"
date: 2013-02-20
categories: 
  - "computermusic"
tags: 
  - "impromptu"
  - "livecoding"
  - "metronome"
---

Metronome: _a device used by musicians that marks time at a selected rate by giving a regular tick_. If you ever felt that you missed a metronome in [Impromptu](http://impromptu.moso.com.au/), here is a little scheme object that can do that job for you.

## Function: `make-metroclick `

The make-metroclick function returns a closure that can be called with a specific time in beats, so that it plays a sound for each beat and marks the downbeat using a different sound.

Possibly useful in order to keep track of the downbeats while you compose, or just to experiment a little with some rhythmic figures before composing a more complex drum kit section.

Here's a short example of how to use it:

<iframe width="560" height="315" src="https://www.youtube.com/embed/bD27-u8XSd8?si=BEsQrYBYrh1BC6QW" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Make-metronome relies on the standard libraries that come with Impromptu, in particular make-metro, which is [described in this tutorial](http://impromptu.moso.com.au/tutorials/making_music/Beat%20%26%20Tempo.html)e and on this [video](http://impromptu.moso.com.au/resources.html#faq7). Essentially, it requires you to define a _metro_ object first, e.g. (define \*metro\* (make-metro 120)).

Here's the source code:

<script src="https://gist.github.com/lambdamusic/4991900.js"></script>
