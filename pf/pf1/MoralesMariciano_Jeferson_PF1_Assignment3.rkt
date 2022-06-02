;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MoralesMariciano_Jeferson_PF1_Assignment3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; E1
;; Data types
; Number
; Median is a Number
; interpretation: median of 3 given numbers

;; Input/Output
; median: Number Number Number -> Median
; given 3 numbers, returns their median
; header:
; (define (median N1 N2 N3) Median)

;; Examples
(check-expect (median 1 2 3) 2)
(check-expect (median 3 2 1) 2)
(check-expect (median 1 3 2) 2)
(check-expect (median 1 2 3) 2)
(check-expect (median 3 1 2) 2)
(check-expect (median 4 2 8) 4)

;; Template
; (define (median n1 n2 n3)
;   (cond
;     [(or (and (<= n1 n3) (<= n3 n2))
;          (and (<= n2 n3) (<= n3 n1)))
;      (... n3 ...)]
;     [(or (and (<= n1 n2) (<= n2 n3))
;         (and (<= n3 n2) (<= n2 n1)))
;      (... n2 ...)]
;     [else (... n1 ...)]))

;; Code
(define (median n1 n2 n3)
  (cond
    [(or (and (<= n1 n3) (<= n3 n2))
         (and (<= n2 n3) (<= n3 n1)))
     n3]
    [(or (and (<= n1 n2) (<= n2 n3))
         (and (<= n3 n2) (<= n2 n1)))
     n2]
    [else n1]))

;************************************************************

;;; E2
;; Data types
; Number
; Maximum is a Number
; interpretation: maximum of 3 given numbers

;; Input/Output
; 3-max: Number Number Number -> Maximum
; given 3 numbers, returns their maximum
; header:
; (define (3-max n1 n2 n3) Maximum)

;; Examples
(check-expect (3-max 1 2 3) 3)
(check-expect (3-max 3 2 1) 3)
(check-expect (3-max 1 3 2) 3)
(check-expect (3-max 1 2 3) 3)
(check-expect (3-max 3 1 2) 3)
(check-expect (3-max 4 2 8) 8)

;; Template
; (define (median n1 n2 n3)
;  (cond
;    [(or (and (<= n1 n3) (<= n2 n3))
;         (and (<= n2 n3) (<= n1 n3)))
;     (... n3 ...)]
;    [(or (and (<= n1 n2) (<= n3 n2))
;         (and (<= n3 n2) (<= n1 n2)))
;     (... n2 ...)]
;    [else (... n1 ...)]))

;; Code
(define (3-max n1 n2 n3)
  (cond
    [(or (and (<= n1 n3) (<= n2 n3))
         (and (<= n2 n3) (<= n1 n3)))
     n3]
    [(or (and (<= n1 n2) (<= n3 n2))
         (and (<= n3 n2) (<= n1 n2)))
     n2]
    [else n1]))

;************************************************************
;;; E3
;; Data types
; Point is a struct built-in type
; interpretation: point with x and y coordinates

;; Input/Output
; left-of? : Point Point -> Boolean
; given two points, determines if the second point lies to the left of the first
; header:
; (define (left-of? p1 p2) Boolean)

;; Examples
(check-expect (left-of? (make-posn 1 1) (make-posn 0 10)) #t)
(check-expect (left-of? (make-posn 100 100) (make-posn 5 4)) #t)
(check-expect (left-of? (make-posn 10 24) (make-posn 45 23)) #f)

;; Template
; (define (left-of? p1 p2)
;   (... p1, p2 ...))

;; Code
(define (left-of? p1 p2)
  (<= (posn-x p2) (- (posn-x p1) 1)))

;************************************************************
;;; E4
;; Data types
; Point is a struct built-in type
; interpretation: point with x and y coordinates

;; Input/Output
; mirror-vertical : Point -> Point
; given a point, returns a point with the same height on the opposite x value
; header:
; (define (mirror-vertical point) Point)

;; Examples
(check-expect (mirror-vertical (make-posn 3 7)) (make-posn -3 7))
(check-expect (mirror-vertical (make-posn -3 7)) (make-posn 3 7))
(check-expect (mirror-vertical (make-posn 0 7)) (make-posn 0 7))

;; Template
; (define (mirror-vertical point)
;   (... point ...))

;; Code
(define (mirror-vertical point)
  (make-posn (* -1 (posn-x point)) (posn-y point)))

;************************************************************
;;; E5
;; Data types
; a Month is one of these Strings:
; - "January"
; - "February"
; - "March"
; - "April"
; - "May"
; - "June"
; - "July"
; - "August"
; - "September"
; - "October"
; - "November"
; - "Dicember"
; interpretation: names of the moths of the year
    
;************************************************************
;;; E6
;; Data types
; Number
; a Month is a String
; interpretation: a month of a year represented by its name

;; Input/Output
; number->month : Number -> Month
; given a month number, returns the corresponding name
; header:
; (define (number->month num) Month)

;; Examples
(check-expect (number->month 1) "January")
(check-expect (number->month 2) "February")
(check-expect (number->month 3) "March")
(check-expect (number->month 4) "April")
(check-expect (number->month 5) "May")
(check-expect (number->month 6) "June")
(check-expect (number->month 7) "July")
(check-expect (number->month 8) "August")
(check-expect (number->month 9) "September")
(check-expect (number->month 10) "October")
(check-expect (number->month 11) "November")
(check-expect (number->month 12) "Dicember")

;; Template
; (define (number->month num)
;(cond
;    [(= num 1) (... num ...)]
;    [(= num 2) (... num ...)]
;    [(= num 3) (... num ...)]
;    [(= num 4) (... num ...)]
;    [(= num 5) (... num ...)]
;    [(= num 6) (... num ...)]
;    [(= num 7) (... num ...)]
;    [(= num 8) (... num ...)]
;    [(= num 9) (... num ...)]
;    [(= num 10) (... num ...)]
;    [(= num 11) (... num ...)]
;    [(= num 12) (... num ...)]))

;; Code
(define (number->month num)
  (cond
    [(= num 1) "January"]
    [(= num 2) "February"]
    [(= num 3) "March"]
    [(= num 4) "April"]
    [(= num 5) "May"]
    [(= num 6) "June"]
    [(= num 7) "July"]
    [(= num 8) "August"]
    [(= num 9) "September"]
    [(= num 10) "October"]
    [(= num 11) "November"]
    [(= num 12) "Dicember"]))

;************************************************************
;;; E7
;; Data types
; a Year is a Number
; interpretation: a year represented in Number

;; Input/Output
; leap-year? : Year -> Boolean
; given a year, state if it's a leap year or not
; header:
; (define (leap-year? year) Boolean)

;; Examples
(check-expect (leap-year? 1868) #t)
(check-expect (leap-year? 1900) #f)
(check-expect (leap-year? 1904) #t)
(check-expect (leap-year? 2000) #t)

;; Template
; (define (leap-year? year)
;   (... year ...))

;; Code
(define (leap-year? year)
  (or
   (and              ; if year is multiple of 4 and not 100
    (= 0 (modulo year 4))
    (not (= 0 (modulo year 100))))
   (and              ; if year is multiple of 4, 100 and 400
    (= 0 (modulo year 4))
    (= 0 (modulo year 100))
    (= 0 (modulo year 400)))))

;************************************************************
;;; E8
;; Data types
; a Day is a non negative Number between the interval [1, 31]
; interpretation: a number representing the day of a month
; a Month is a non negative Number between the interval [1, 12]
; interpretation: a number representing the month of a year
; a Year is a Number with n!=0
; interpretation: a number representing the year of the date

;************************************************************
;;; E9
;; Data types
; String
; a Date is a structure (make-date day month year)
;   where day   : Number
;         month : Number
;         year  : Number
; interpretation: a date with the day, month and year as numbers
(define-struct date [day month year])

;; Input/Output
; date->string : Date -> String
; given a date, returns its string representation
; header:
; (define (date->string mydate) String)

;; Examples
(check-expect (date->string (make-date 30 3 -1204)) "30 March 1204 BCE")
(check-expect (date->string (make-date 14 9 2020)) "14 September 2020")

;; Template
; (define (date->string mydate)
;   (... mydate ...))

;; Code
(define (date->string mydate)
  (string-append 
   (number->string (date-day mydate))
   " "
   (number->month (date-month mydate))
   " "
   (if [< (date-year mydate) 0]
       [string-append
        (number->string (abs (date-year mydate)))
        " BCE"]
       [number->string (date-year mydate)])))

;************************************************************
;;; E10
;; Data types
; a Month-Number is a Number
; interpretation: a valid number of a month between the interval [1-12]
; a Month-Days is one of this Numbers:
; - 28 (February)
; - 30 (April, June, September, November)
; - 31 (January, March, May, July, August, October, Dicember)
; interpretation: the amount of days in a month in a non-leap year

;; Input/Output
; days-in-month : Month-Number -> Month-Days
; given a month number, returns its days in a non-leap year
; header:
; (define (days-in-month month-n) Month-Days) 

;; Examples
(check-expect (days-in-month 2) 28)
(check-expect (days-in-month 1) 31)
(check-expect (days-in-month 6) 30)

;; Template
; (define (days-in-month month-n)
;   (cond
;    [(= 2 month-n) (... month-n ...)]
;    [(or (= 4 month-n)
;         (= 6 month-n)
;         (= 9 month-n)
;         (= 11 month-n))
;     (... month-n ...)]
;    [else (... month-n ...)]))

;; Code
(define FEB-NUM 2)
(define APR-NUM 4)
(define JUN-NUM 6)
(define SEP-NUM 9)
(define NOV-NUM 11)

(define (days-in-month month-n)
  (cond
    [(= FEB-NUM month-n) 28]
    [(or (= APR-NUM month-n)
         (= JUN-NUM month-n)
         (= SEP-NUM month-n)
         (= NOV-NUM month-n))
     30]
    [else 31]))

;************************************************************
;;; E11
;; Data types
; a Date is a structure (make-date day month year)
;   where day   : Number
;         month : Number
;         year  : Number
; interpretation: a date with the day, month and year as numbers
; (define-struct date [day month year])

;; Input/Output
; date-valid? : Date -> Boolean
; given a date, states if it's valid
; header:
; (define (date-valid? mydate) Boolean)

;; Examples
; zeros
(check-expect (date-valid? (make-date 0 1 1)) #f)
(check-expect (date-valid? (make-date 1 0 1)) #f)
(check-expect (date-valid? (make-date 2 1 0)) #f)
; valid dates
(check-expect (date-valid? (make-date 1 1 -1)) #t)
(check-expect (date-valid? (make-date 14 9 2020)) #t)
(check-expect (date-valid? (make-date 13 10 2021)) #t)
(check-expect (date-valid? (make-date 30 3 -1204)) #t)
; leap years
(check-expect (date-valid? (make-date 29 2 1868)) #t)
(check-expect (date-valid? (make-date 29 2 1904)) #t)
(check-expect (date-valid? (make-date 29 2 2000)) #t)
(check-expect (date-valid? (make-date 29 2 2001)) #f)

;; Template
; (define (date-valid? mydate)
;   (and
;    (1 <= mydate.month <= 12)
;    (mydate.year != 0)
;    (or (and
;         (1 <= mydate.day <= (days-in-month mydate.month))
;         (not (leap-year? mydate.year)))
;        (and (leap-year? mydate.year)
;             (or
;              (and (mydate.month == 2)
;                   (1 <= mydate.day <= 29))
;              (and (not (mydate.month == 2))
;                   (1 <= mydate.day <= (days-in-month mydate.month))))))))

;; Code
;(define FEB-NUM 2)
(define LEAP-FEB-DAYS 29)
(define TOTAL-MONTHS 12)

(define (date-valid? mydate)
  (and
   (<= 1 (date-month mydate) TOTAL-MONTHS)  ; valid month number [1-12]
   (not (= 0 (date-year mydate)))           ; valid year != 0
   (or (and                                 ; if not leap year, check normally number of days in month
        (<= 1 (date-day mydate) (days-in-month (date-month mydate)))
        (not (leap-year? (date-year mydate))))
       (and (leap-year? (date-year mydate)) ; if leap year, differs in checking if February has 29 days
            (or
             (and (= (date-month mydate) FEB-NUM)
                  (<= 1 (date-day mydate) LEAP-FEB-DAYS))
             (and (not (= (date-month mydate) FEB-NUM))
                  (<= 1 (date-day mydate) (days-in-month (date-month mydate)))))))))

;************************************************************