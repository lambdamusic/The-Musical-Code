

# Ableton Live


# Midi CC and Automations

*2023-10-01*

## Arm the track 

From  'arrangement view' or 'session view'. 
Click on the automation arm button to ensure it's selected. 

Arm the track(s) you want to record on.

In Extempore, make sure you have MIDI CC mappings set up for the instrument you are using. 

Click on "Record"

![alt](../assets/../assets/images/livemidicc-20231001204546.png)


*Note:* you'll always record in the arrangement view using this method. You can also record session clips, buy you need to select the Record Session button instead, and subsequently record an arrangements from the sessions

![alt](../assets/images/livemidicc-20231001210133.png)


## Send Midi 

From Extempore

Eg

```scheme
(define channel 1)

; first set up the mapping as usual
; (:midicc 15 (random 1 100))


(define testmidicc
	(lambda (beat dur)

		;; play a note at each beat
		(at 1 0 (play channel C3 20 dur ))
		;; change CC every time the function runs
		(:midicc 15 (cosr (cosr 16 10 1/2) 5 .05))
	
	(callback (*metro* (+ beat (* 1/2 dur)))
		'testmidicc (+ beat dur) dur)))

(testmidicc (*metro* 'get-beat 1) 1/8)
```


You should see the MIDI CC effects in real time - eg if we mapped filter-1 to `Frequency` : 

![alt](../assets/images/livemidicc-20231001205647.png)


## Stop recording

Always better to stop sending MIDI from Extempore first, to avoid strascichi di note. 

Once that is done, stop recording in Live. 

You should have a brand new clip in the armed tracks in the Arrangement view.

![alt](../assets/images/livemidicc-20231001210615.png)

## Warning

Do not set the `Output` to IAC Driver! Leave it to `None`

This is both in the MIDI panel and the MIDI PORTS panel.

If not, the side effect, unexplained, is that Track recording seems to fail as the record button always switches back to inactive. 

Also, the recording of automations leads to unexpected results. 

![alt](../assets/images/livemidicc-20231001202256.png)


## What automations look like 

In the MIDI editor they look like this

![alt](../assets/images/livemidicc-2023-09-30.png)


## See Also

- [How to Record Automation in Ableton Live](https://support.native-instruments.com/hc/en-us/articles/210313785-How-to-Record-Automation-in-Ableton-Live) 