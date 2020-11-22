;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2011-07-fjords.scm -- 
;; 
;; https://www.youtube.com/watch?v=7NlpZNVEVUM
;; 
;; ambient electronica // made with http://impromptu.moso.com.au
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(setup:base)
(setup:create-au syn1 ++zebra 2)
(setup:create-au syn2 ++zebra 3)
(setup:create-au syn3 ++zebra 4)
(setup:create-au pads ++zebra 5)
(patch:load ++zebra syn1 "HS12StringSitar")
(patch:load ++zebra syn2 "ukmDXPad1")
(patch:load ++zebra syn3 "HSHighTeaweed")
(patch:load ++zebra pads "HSDeepFjord")

(setup:create-au kit ++kontakt4 6) 
(patch:load ++kontakt4 kit "Elab_files_house")


;;;;;;;;;
;;;;;;;;;



(define +pc+ '(0 4 7))


(define loop
   (lambda (beat degree) 
      (set! +pc+ (pc:diatonic 0 '^ degree))
      (play syn1 (pc:quantize (sinr 60 20 .01) +pc+) (cosr 40 20 1/2) 1/8)
      (play syn2 (pc:quantize (sinr 60 20 .2) +pc+) (cosr 30 10 1/2) 1/8)
      (play syn3 (pc:quantize (sinr 60 20 .5) +pc+) (cosr 50 20 1/8) 1/8)
      (onbeat? 1 1/2 (play kit 6 110 1/8))  ;; switch between 0 and 1/2
      (onbeat? 8 (- 8 1/4) (dotimes (i 2)
                            (play (* i 1/8) kit (oneof 9 0) 110 1/8)))
      (onbeat? 2 1 (play kit 29 110 1/8))
      (onbeat? 8 (- 8 5/4) (dotimes (i 4)
                            (play (* i (oneof 1/4 1/8)) kit (oneof 29 0) 110 1/8)))
      (onbeat? 2 0 (play kit 26 110 1/8))
      (onbeat? 2 1/4 (dotimes (i 2)
                      (play (* i 1/8) kit (oneof 28 27 0) 110 1/8)))
      (callback (*metro* (+ beat (* 1/2 1/4))) 'loop (+ beat 1/4)
               (random (assoc degree '((i iv)
                                       (iv i vi)
                                       (vi i v)
                                       (v i)))))))

(loop (*metro* 'get-beat 4) 'i)



(zb:volume pads '- 10)
(define spacey
   (lambda (beat dur)
      ; (zb:volume pads '- 5)
      (mu:playchord pads (pc:make-chord 50 70 3 +pc+) '(1 1 1) dur)
     (callback (*metro* (+ beat (* 1/2 dur))) 'spacey (+ beat dur)
               dur)))

(spacey (*metro* 'get-beat 4) 6)



(define t
   (lambda (beat melody) 
      (let ((dur (oneof 3 5))) 
         (play syn1 (car melody) 30 dur)                
         (play 1/4 syn1 (fifth (car melody)) 20 dur)                
         (callback (*metro* (+ beat (* 1/2 dur))) 't (+ beat dur)
                   (if-cdr-notnull melody (pc:make-chord 50 70 3 +pc+))))))

(t (*metro* 'get-beat 4) (pc:make-chord 50 70 3 +pc+))



