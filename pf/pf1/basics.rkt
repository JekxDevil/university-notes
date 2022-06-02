;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |220921|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
; 3 = 3
3

; 2 + 5 = 7
(+ 2 5)

; 9 + 12 + 100 = 121
(+ 9 12 100) ; could also be done with partial operations

; 1 + 2 + 3 * 4 = 15
(+ 1 2 (* 3 4))

; square root of 144 = 12
(sqrt 144)

; 2^3 * 2 = 16
(* (expt 2 3) 2)
|#

(define (square n)
  (* n n))
