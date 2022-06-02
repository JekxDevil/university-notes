;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MoralesMariciano_Jeferson_PF1_Assignment5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; 1
;; Data Types
; List<Number> is one of
; - '()
; - (cons Number List<Number>)
; interpretation : list of numbers

;; Examples
; '()                   : could be and empty list of numbers
; (cons 1 (cons 3 '())) : a list of numbers with 2 elements
; (cons 5 '())          : a list with an element
(define LON1 (cons 1 (cons 2 '())))
(define LON2 (cons 3 (cons 2 (cons 7 '()))))

;**************************************************************************************************
;;; 2
;; Data Types
; List<Number>

;; Input/Output
; add-5 : List<Number> -> List<Number>
; given a list of numbers, add 5 to each item
; header :
; (define (add-5 lon) List<Number>)

;; Examples
(check-expect (add-5 LON1) (cons 6 (cons 7 '())))
(check-expect (add-5 LON2) (cons 8 (cons 7 (cons 12 '()))))
(check-expect (add-5 '()) '())

;; Template
; (define (add-5 lon)
;   (cond [(empty? lon) ... lon ...]
;         [else         ... lon ...]))

;; Code
(define (add-5 lon)
  (cond [(empty? lon) '()]
        [else (cons (+ 5 (first lon)) (add-5 (rest lon)))]))

;**************************************************************************************************
;;; 3
;; Data Types
; Name is a String
; interpretation : a person's name
; List<Name> is one of
; - '()
; - (cons Name List<Name>)
; interpretation : list of Names

;; Examples
; '()                            : is a list of names
; (cons "jeferson" '()           : is a list of names with one element
; (cons "gief" (cons "luca" '()) : is a list of names with 2 elements
(define LONAMES1 (cons "Strange" (cons "Foster" '())))
(define LONAMES2 (cons "myname" (cons "yourname" '())))

;**************************************************************************************************
;;; 4
;; Data Types
; List<Name>
; String

;; Input/Output
; add-title : List<Name> String -> List<Name>
; given a list of names and a title, return the title as prefix of each item
; header :
; (define (add-title lon title) List<Name>)

;; Examples
(check-expect (add-title LONAMES1 "Dr ")
              (cons "Dr Strange" (cons "Dr Foster" '())))
(check-expect (add-title LONAMES2 "") LONAMES2)
(check-expect (add-title '() "qwerty") '())
(check-expect (add-title '() "") '())

;; Template
; (define (add-title lon title)
;   (cond [(empty? lon) ... lon ...]
;         [else ...]
        
;; Code
(define (add-title lon title)
  (cond [(empty? lon) '()]
      [else (cons (string-append title (first lon)) (add-title (rest lon) title))]))

;**************************************************************************************************
;;; 5
;; Data Types
; List<Number>
; Number

;; Input/Output
; min-list : List<Number> -> Number
; given a list of numbers, return the minimum value
; header :
; (define (min-list lon) Number)

;; Examples
(check-expect (min-list (cons 10 (cons 9 (cons 8 (cons 7 (cons 6 (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 '()))))))))))) 1)
(check-expect (min-list (cons 4 (cons 3 (cons 2 (cons 1 '()))))) 1)
(check-expect (min-list (cons 2 (cons 4 (cons 1 (cons 3 '()))))) 1)
(check-expect (min-list (cons 3 (cons 1 (cons 2 (cons 3 '()))))) 1)
(check-expect (min-list (cons 1 (cons 2 (cons 3 (cons 4 '()))))) 1)

;; Template
; (define (min-list lon)
;   (cond [(empty? (rest lon))                   ... lon ...]
;         [(< (first lon) (min-list (rest lon))) ... lon ...]
;         [else                                  (min-list (rest lon))]))

;; Code
(define (min-list lon)
  (cond [(empty? (rest lon)) (first lon)]
        [(< (first lon) (min-list (rest lon))) (first lon)]
        [else (min-list (rest lon))]))

;**************************************************************************************************
;;; 6
;; Data Types
; List<Number>

;; Input/Output
; 2min-list : List<Number> -> List<Number>
; given a list of numbers with at least two elements, return the two smallest ones in a list
; header :
; (define (2min-list lon) List<Number>)

;; Examples
(check-expect (2min-list (cons 10 (cons 9 (cons 8 (cons 7 (cons 6 (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 '())))))))))))
              (cons 1 (cons 2 '())))
(check-expect (2min-list (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 (cons 7 (cons 8 (cons 9 (cons 10 '())))))))))))
              (cons 1 (cons 2 '())))
(check-expect (2min-list (cons 8 (cons 2 (cons 10 (cons 4 (cons 5 (cons 6 (cons 7 (cons 3 (cons 1 (cons 9 '())))))))))))
              (cons 1 (cons 2 '())))
(check-expect (2min-list (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 '()))))))
              (cons 1 (cons 2 '())))
(check-expect (2min-list (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 '()))))))
              (cons 1 (cons 2 '())))
(check-expect (2min-list (cons 4 (cons 1 (cons 5 (cons 2 (cons 3 '()))))))
              (cons 1 (cons 2 '())))
(check-expect (2min-list (cons 3 (cons 2 (cons 1 '()))))
              (cons 1 (cons 2 '())))
(check-expect (2min-list (cons 2 (cons 1 '())))
              (cons 1 (cons 2 '())))

;; Template
; (define (2min-list lon)
;   (cons (min-list lon)                                 ; first minimum element in list got by min-list
;         (cons (min-list (remove (min-list lon) lon))   ; second minimum got by removing the first and reusing min-list
;               '())))                                   ; end list

;; Code
(define (2min-list lon)
  (cons (min-list lon)
        (cons (min-list (remove (min-list lon) lon))
              '())))

;**************************************************************************************************
;;; 7
;; Data Types
; List<Posn> is one of
; - '()
; - (cons Posn List<Posn>)
; interpretation : non-empty list of posn

;; Examples
; (cons (make-posn 1 1) '())
; (cons (make-posn 1 1) (cons (make-posn 2 2) '()))
; '() --> ERROR the list must be non-empty has the Data Type says
(define LOP1 (cons (make-posn 5 3) (cons (make-posn 3 2) (cons (make-posn 2 3) '()))))
(define LOP2 (cons (make-posn 3 2) (cons (make-posn 2 3) '())))
(define LOP3 (cons (make-posn 2 3) (cons (make-posn 3 2) '())))

;**************************************************************************************************
;;; 8
;; Data Types
; List<Posn>
; Posn

;; Input/Output
; min-x : List<Posn> -> Posn
; given a list of Posn, return the Posn with the lowest 'x' value
; header :
; (define (min-x lop))

;; Examples
(check-expect (min-x LOP1) (make-posn 2 3))
(check-expect (min-x LOP2) (make-posn 2 3))
(check-expect (min-x LOP3) (make-posn 2 3))

;; Template
; (define (min-x lop)
;   (cond [(empty? (rest lop))             ... lop ...]            ; empty list should return the latest posn
;         [(< (posn-x (first lop))
;             (posn-x (min-x (rest lop)))) ... lop ...]            ; compare the 'x' posn between them recursively choosing the first if lowest
;         [else                            (min-x (rest lop))]))   ; if the current first is not the lowest, recursively search another

;; Code
(define (min-x lop)
  (cond [(empty? (rest lop)) (first lop)]
        [(< (posn-x (first lop))
            (posn-x (min-x (rest lop)))) (first lop)]
        [else (min-x (rest lop))]))

;**************************************************************************************************
;;; 9
;; Data Types
; Natural is a Number
; List<Number>

;; Input/Output
; self-powers : Natural -> List<Number>
; taking a natural number, return a list of numbers power of themself
; header :
; (define (self-powers n) List<Number>)

;; Examples
(check-expect (self-powers 0) '())
(check-expect (self-powers 3) (cons 27 (cons 4 (cons 1 '()))))
(check-expect (self-powers 4) (cons 256 (cons 27 (cons 4 (cons 1 '())))))

;; Template
; (define (self-powers n)
;   (cond [(= n 0) ...]
;         [else    (cons ... (self-powers ... ))]))

;; Code
(define (self-powers n)
  (cond [(= n 0) '()]
        [else (cons (expt n n) (self-powers (- n 1)))]))