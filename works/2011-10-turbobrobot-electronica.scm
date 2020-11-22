;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2011-10-turborobot-electronica.scm -- 
;; 
;; https://www.youtube.com/watch?v=y2xX-r7MX6Q
;; 
;; house electronica // made with http://impromptu.moso.com.au
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(setup:base)
(setup:create-au bass ++zebra 2)
(setup:create-au brass ++zebra 3)
(setup:create-au synth ++zebra 5)
(patch:load-zebrapatch bass "dl_comb_bass")
(patch:load-zebrapatch brass "bigbrass.patch")
(setup:create-au bat ++battery3 4)
(patch:load-batterypatch bat "staticgoldmine")

(define =kick1= 1)
(define =kick2= 2)
(define =snare1= 14)
(define =snare2= 15)
(define =snaremute= 17)
(define =snareechoed= 18)
(define =hihat1= 30)



(define bassline
   (lambda (beat) 
      (let ((dur (ifbeat-gt? 8 3 2 2)))
         (play bass c3 50 1/8) 
         (play 1/2 bass c4 60 1/16) 
         (play 1 bass g4 40 1/16) 
         (play 3/2 bass g3 60 1/16) 
         (ifbeat-btw? 16 0 4
                     (play bass c5 60 1/16))
         (ifbeat-btw? 16 4 10
                     (play 1/2 bass g5 50 1/16))
         (ifbeat-btw? 16 8 12
                     (dotimes (i 4)
                        (play (* i 1/16) bass g3 50 1/16)))
          
     (callback (*metro* (+ beat (* 1/2 dur))) 'bassline (+ beat dur)))))

(bassline (*metro* 'get-beat 4))






(define kit
   (lambda (beat) 
      (let ((dur 1/8))
          (onbeat? 2 1 (play bat 1 80 1))
          ;(onbeat? 4 1/2 (play bat 17 70 1))
          (onbeat? 4 3/2 (play bat 18 70 1))
          (ifbeat? 1 0 (play bat 2 70 1)
                (play bat (cosr 15 5 1/4) 
                        (cosr 30 5 1/2) 1/8))
          ;(onbeat? 8 '(1 3 5/2) (dotimes (i (random 1 3))
          ;               (play (* i 1/8) bat 14 60 1)))
         (onbeat? 1 1/2 (play bat 30 60 1/8))
         ;(onbeat? 4 (+ 1/8 1/2) (play bat 30 60 1/8))
         (onbeat? 2 1 (play bat 15 60 1/8))
         (onbeat? 8 (+ 1 1/4) (play (random 0 0 1/4 3/2) bat 15 60 1/8))
     (callback (*metro* (+ beat (* 1/2 dur))) 'kit (+ beat dur)))))

(kit (*metro* 'get-beat 4))




(define brasses
   (lambda (beat chord) 
      (let ((dur 1/2))
         (for-each (lambda (c)
                      (play brass c (cosr 25 10 1/4) dur))
                   chord)
         (ifbeat-btw? 8 0 1 (play brass c3 10 6))
         (ifbeat-btw? 8 2 3 (play brass g4 10 6))
         (ifbeat-btw? 16 4 5 (play brass c5 30 6))
         (ifbeat-btw? 16 8 9 (play brass c7 20 6))
          
     (callback (*metro* (+ beat (* 1/2 dur))) 'brasses (+ beat dur) 
               (ifbeat-btw? 16 8 14 
                           (pc:make-chord 90 120 4 (pc:chord 5 '^))
                           achord)))))


(define achord (pc:make-chord 90 120 2 (pc:chord 0 '^9)))
;;
(brasses (*metro* 'get-beat) (pc:make-chord 90 120 2 (pc:chord 0 '^9))) 




(define finale
   (lambda (beat mel) 
      (let ((dur 1/4)
            (newmelody (make-list-with-proc 8 (lambda (x)
                                         (pc:random 65 75 '(7))))))
         (play synth (car mel) 10 dur)
         (play 1/8 synth (+ 12 (car mel)) 10 1/8)
         (play 2/8 synth (+ 24 (car mel)) 10 1/8)
          ;(print mel)
     (callback (*metro* (+ beat (* 1/2 dur))) 'finale (+ beat dur)
               (if-cdr-notnull mel newmelody)))))

(finale (*metro* 'get-beat 4) (list c5 c4 c4 c4 c3))






