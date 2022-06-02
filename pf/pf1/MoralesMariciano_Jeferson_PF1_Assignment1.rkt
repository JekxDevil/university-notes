;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname asign1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; EXPRESSIONS AND BASIC TYPES

;; 1
(define FIRST-WEEK 5)
(define SECOND-WEEK 8)
(define THIRD-WEEK 12)
(define FOURTH-WEEK 10)
(define TOTAL-HOURS
  (+ FIRST-WEEK SECOND-WEEK THIRD-WEEK FOURTH-WEEK))

(define ES1
  (string-append
   "Ex.1 - Total hours of study: "
   (number->string TOTAL-HOURS)))

ES1
;***************************************************************


;; 2
(define WEEKS 4)
(define AVERAGE-HOURS
  (/ TOTAL-HOURS WEEKS))

(define ES2
  (string-append
   "Ex.2 - Average hours of study per week: "
   (number->string-digits AVERAGE-HOURS 2)))

ES2
;***************************************************************


;; 3
; data
(define KMH1 80)
(define MIN1 22)

(define KMH2 120)
(define HOUR2 1)

(define KMH3 90)
(define HOUR3 1)
(define MIN3 20)

; constant conversion factor
(define MIN_TO_HOUR 60) 

(define DISTANCE-TRAVELED
  (+
   (* KMH1 (/ MIN1 MIN_TO_HOUR))
   (* KMH2 HOUR2)
   (* KMH3 (+ HOUR3 (/ MIN3 MIN_TO_HOUR)))))

(define ES3
  (string-append
   "Ex.3 - Train traveled distance: "
   (number->string-digits DISTANCE-TRAVELED 1)))

ES3
;***************************************************************

;; 4
; data
(define STAND-COST 12)
(define STAND-DIAM 33)
(define BABY-COST 9)
(define BABY-DIAM 18)

(define STANDARD-BETTER?
  (< (/ STAND-COST (/ (* pi STAND-DIAM STAND-DIAM) 4))
     (/ BABY-COST (/ (* pi BABY-DIAM BABY-DIAM) 4))))

(define ES4
  (string-append
   "Ex.4 - Is the standard pizza price more convenient per square centimeter? "
   (boolean->string STANDARD-BETTER?)))

ES4
;****************************************************************

;; 5
(define HI-TO-ME
  (string-append "Hello " "Jeferson" ", welcome to PF1!"))

(define ES5
  (string-append "Ex.5 - " HI-TO-ME))

ES5
;*****************************************************************

;; 6
(define (greet name)
  (string-append "Hello " name ", welcome to PF1!"))

(define ES6
  (string-append "Ex.6 - " (greet "Jef")))

ES6
;****************************************************************

;;; DRAWING SHAPES
(require 2htdp/image)

; no vehiculation allowed
(define NO-VEHICULATION
  (overlay
   (circle 110 "solid" "white")
   (circle 150 "solid" "red")))

; traffic lights warning signal
(define PEN-LIGHTS (pen "black" 3 "solid" "round" "round"))
(define WARNING
  (overlay/offset (triangle 250 "solid" "white")
                  0 -7
                  (triangle 300 "solid" "red")))

(define RED-LIGHT (overlay
                   (circle 20 "outline" PEN-LIGHTS)
                   (circle 20 "solid" "red")))

(define YELLOW-LIGHT (overlay
                      (circle 20 "outline" PEN-LIGHTS)
                      (circle 20 "solid" "yellow")))

(define GREEN-LIGHT (overlay
                     (circle 20 "outline" PEN-LIGHTS)
                     (circle 20 "solid" "green")))

(define TRAFFIC-LIGHTS (overlay/offset
                        (overlay/offset
                         (overlay/offset RED-LIGHT 0 50 YELLOW-LIGHT)
                         0 75 GREEN-LIGHT)
                        0 -20 WARNING))

; end of bicycle path
(define PEN-WHITE (pen "white" 2 "solid" "round" "round"))
(define REGULATORY-SIGN
  (overlay (circle 140 "solid" (color 26 103 187))
           (circle 140 "outline" PEN-LIGHTS)
           (circle 150 "solid" "white")
           (circle 150 "outline" PEN-LIGHTS)))

(define WHEEL
  (circle 20 "outline" PEN-WHITE))

(define BICYCLE
  (overlay/offset (circle 7 "outline" PEN-WHITE) 0 -15
                  (overlay/offset (circle 4 "solid" "white") -50 -15
                                  (overlay/offset WHEEL -60 -15
                                                  (add-line
                                                   (add-line
                                                    (add-line
                                                     (add-line
                                                      (add-line
                                                       (add-line
                                                        (add-line 
                                                         (add-line
                                                          (add-curve
                                                           (add-line
                                                            (add-line
                                                             (add-line
                                                              (add-line WHEEL 50 -20 20 20 PEN-WHITE); front fork
                                                              47 5 100 5 PEN-WHITE); barrel
                                                             50 0 43 0 PEN-WHITE); handler-bar barrel
                                                            43 0 45 -4 PEN-WHITE); base handler-bar
                                                           45 0 40 1
                                                           55 -2 0 0 PEN-WHITE); wristbase handler-bar
                                                          38 25 70 50 PEN-WHITE); left base
                                                         70 50 100 11 PEN-WHITE); upper right base
                                                        100 15 120 50 PEN-WHITE); seat back wheel
                                                       70 50 120 50 PEN-WHITE); right base
                                                      95 10 105 10 PEN-WHITE); seat
                                                     69 40 72 59 PEN-WHITE); line pedal
                                                    70 61 75 60 PEN-WHITE); low pedal
                                                   66 39 71 38 PEN-WHITE)))));top pedal

(define END-BIKE-PATH
  (overlay (scale 1.7 BICYCLE) REGULATORY-SIGN))

NO-VEHICULATION
TRAFFIC-LIGHTS
END-BIKE-PATH