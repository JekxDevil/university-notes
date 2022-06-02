;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MoralesMariciano_Jeferson_PF1_Assignment2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; E1
;; Data type
; a Cm is the centimeters length unit Number
; interpretation: a number x of centimeters
;******************************************************

;;; E2
;; Data type
; an Inch is the inches length unit Number
; interpretation: a number x of inches
;******************************************************

;;; E3
;; Data types
; a Cm is the centimeters length unit Number
; interpretation: a number x of centimeters

; an Inch is the inches length unit Number
; interpretation: a number x of inches

;; Input/Output
; inch->cm : Inch -> Cm
; converts inches to centimeters
; header:
; (define (inch->cm inch) cm)

;; Examples
(check-expect (inch->cm 5) 12.7)
(check-expect (inch->cm -1) -2.54)
(check-expect (inch->cm 0.1) 0.254)

;; Template
; (define (inch->cm inch cm)
;   ... inch to cm ...)

;; Code
(define INCH-TO-CM 2.54)
(define (inch->cm inch)
    (* inch INCH-TO-CM))
;******************************************************

;;; E4
;; Data types
; a Mean is a Number
; interpretation: the sum of 4 numbers

;; Input/Output
; mean/4 : sum -> average
; given a sum of 4 numbers, returns its average
; header:
; (define (mean/4 sum) average)

;; Examples
(check-expect (mean/4 4) 1)
(check-expect (mean/4 8) 2)
(check-expect (mean/4 -16) -4)

;; Template
;(define (mean/4 sum)
;  ... mean/4 ...)

;; Code
(define (mean/4 sum)
  (/ sum 4))
;******************************************************

;;; E5
;; Data types
; Area, Base and Height are Number types
; interpretation: base and height of a triangle to calculate the area

;; Input/Output
; area-triangle : base * height / 2 -> area
; given base and height of a triangle, compute its area
; header:
; (define (area-triangle base height) area)

;; Examples
(check-expect (area-triangle 0 0) 0)
(check-expect (area-triangle 3 5) 7.5)
(check-expect (area-triangle 2 4) 4)

;; Template
;(define (area-triangle base height)
;  ... base * height / 2 ...)

;; Code
(define (area-triangle base height)
  (/ (* base height) 2))
;******************************************************

;;; E6
;; Data types
; a Perfect-Square is a Number
; interpretation: a perfect square is an integer that's also a square of another integer

;; Input/Output
; perfect-square? : #true or #false
; given a number, state if it's a perfect square
; header:
; (define (perfect-square? number) boolean)

;; Examples
(check-expect (perfect-square? 4) #true)
(check-expect (perfect-square? 2) #false)
(check-expect (perfect-square? -4) #false)

;; Template
;(define (perfect/square? number)
;  ... #true or #false ...)

;; Code
(define (perfect-square? number)
  (if [and (integer? number) (integer? (sqrt number))]
   #true
   #false))
;******************************************************

;;; E7
;; Data types
; the Price is a Number
; interpretation: the price in CHF
;******************************************************

;;; E8
;; Data types
; a Roll is a Number
; interpretation: toilet paper rolls bought
; the Price is a Number
; interpretation: the price in CHF

;; Input/Output
; final-price : rolls -> price
; given a number of rolls, the function apply a discount if available and return the total cost
; header:
; (define (final-price rolls) price)

;; Examples
(check-expect (final-price 0) 0)
(check-expect (final-price 40) 68)
(check-expect (final-price 18) 32.4)
(check-expect (final-price 5) 10)

;; Template
;(define (final-price rolls)
;  ...  rolls * price ...
;  ...  if rolls > x,y = discount ... )

;; Code
(define COST 2)
(define MINOR-DISCOUNT-ROLLS 6)
(define MINOR-DISCOUNT-PERCENT 10)
(define MAYOR-DISCOUNT-ROLLS 18)
(define MAYOR-DISCOUNT-PERCENT 15)

(define (final-price rolls)
  (cond
    [(<= rolls MINOR-DISCOUNT-ROLLS)
     (* rolls COST)]
    [(< MINOR-DISCOUNT-ROLLS rolls (+ MAYOR-DISCOUNT-ROLLS 1))
     (- (* rolls COST) (/ (* (* rolls COST) MINOR-DISCOUNT-PERCENT) 100))]
    [(> rolls MAYOR-DISCOUNT-ROLLS)
     (- (* rolls COST) (/ (* (* rolls COST) MAYOR-DISCOUNT-PERCENT) 100))]))
;******************************************************

;;; E9
;; Data types
; a Latin-Note one of these Strings:
; {do, re, mi, fa, sol, la, si}
; interpretation: string representing a neo-latin note
; a English-Note one of these Strings:
; {A, B, C, D, E, F, G}
; interpretation: string representing an english note

;; Input/Output
; note-latin->note-english: latin-note -> english-note
; given a neo-latin note, it returns the corresponding english note
; header:
; (define (note-latin->note-english latin-note) english-note)

;; Examples
(check-expect (note-latin->note-english "do") "C")
(check-expect (note-latin->note-english "re") "D")
(check-expect (note-latin->note-english "mi") "E")
(check-expect (note-latin->note-english "fa") "F")
(check-expect (note-latin->note-english "sol") "G")
(check-expect (note-latin->note-english "la") "A")
(check-expect (note-latin->note-english "si") "B")
(check-expect (note-latin->note-english "qwerty") "Error handling")

;; Template
;(define (note-latin->note-english latin-note)
;  ... matching latin = english notes ...)

;; Code
(define (note-latin->note-english latin-note)
  (cond
    [(string-ci=? "do" latin-note) "C"]
    [(string-ci=? "re" latin-note) "D"]
    [(string-ci=? "mi" latin-note) "E"]
    [(string-ci=? "fa" latin-note) "F"]
    [(string-ci=? "sol" latin-note) "G"]
    [(string-ci=? "la" latin-note) "A"]
    [(string-ci=? "si" latin-note) "B"]
    [else "Error handling"]))
;******************************************************

;;; E10
;; Data types
; a Quarter is a Number
; interpretation: the quarter of an hour
; an Angle is a Number [0-360]
; interpretation: an angle of the clock circle

;; Input/Output
; quarter->angle : quarter of hour -> angle of clock
; given a quarter number, draw the corresponding angle in the clock
; header:
; (define (quarter->angle quarter) angle)

;; Examples
(check-expect (quarter->angle 0) 90)
(check-expect (quarter->angle 1) 0)
(check-expect (quarter->angle 2) 270)

;; Template
;(define (quarter->angle quarter)
;  ... quarter to angle ...) 

;; Code
(define (quarter->angle quarter)
  (cond
    [(= quarter 0) 90]
    [(= quarter 1) 0]
    [(= quarter 2) 270]
    [(= quarter 3) 180]))
;******************************************************

;;; E11
(require 2htdp/image)
(define CLOCK-BODY
  (circle 100 "solid" "red"))
(define MINUTES-HAND
  (rectangle 100 4 "solid" "black"))

;; Data types
; a Quarter is a Number
; interpretation: the quarter of an hour
; a Clock is an Image
; interpretation: clock visually representing quarter of hours

;; Input/Output
; clock-minutes : quarter of hour -> clock image
; given a quarter hours, it gives the corresponding clock image
; header:
; (define (clock-minutes quarter) image)

;; Examples
(define QUARTER-PAST
          (overlay/offset MINUTES-HAND -50 -2 CLOCK-BODY))
(define QUARTER-TO
          (rotate 180 (overlay/offset MINUTES-HAND -50 -2 CLOCK-BODY)))
(define O-CLOCK
          (rotate 90 (overlay/offset MINUTES-HAND -50 -2 CLOCK-BODY)))
(define HALF-AN-HOUR
          (rotate 270 (overlay/offset MINUTES-HAND -50 -2 CLOCK-BODY)))

(check-expect (clock-minutes 0) O-CLOCK)
(check-expect (clock-minutes 1) QUARTER-PAST)
(check-expect (clock-minutes 2) HALF-AN-HOUR)
(check-expect (clock-minutes 3) QUARTER-TO)
(check-expect (clock-minutes 4) O-CLOCK)

;; Template
;(define (clock-minutes quarter)
;  ... create clock image ...) 

;; Code
(define (clock-minutes quarter)
  (rotate (quarter->angle (modulo quarter 4))
          (overlay/offset MINUTES-HAND -50 -2 CLOCK-BODY)))
;******************************************************