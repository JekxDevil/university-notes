;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname MoralesMariciano_Jeferson_PF1_Assignment6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LIBRARIES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 2htdp/batch-io)   ; (read-lines)
(require racket/string)    ; (string-split)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONSTANTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define CSV-CHAR ",")
(define EXAMPLE-CSV "flights.csv")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FIELDS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Data Types
; Field is a struct:
; (make-field name content)
; where name    : String
;       content : Any
; interpretation: a field with a title name and its content 
(define-struct field [name content])

;; Examples
(define EX1-FIELD (make-field "date" "2012-02-12"))
(define EX2-FIELD (make-field "number" "17012003"))

;**************************************************************************************
; Record is one of:
; - '()
; - (cons Field Record)
; interpretation: list of records containing structured CSV fields

;; Examples
(define EX1-RECORD (list EX1-FIELD))
(define EX2-RECORD (list EX2-FIELD))
(define EX3-RECORD (list EX1-FIELD  EX2-FIELD))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; METHODS - FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;** GET FIELD *************************************************************************
;; Data types
; String
; Field
; Record
; Maybe<Any> is one of
; - Any    if corresponding to a record content type
; - #false
; interpretation: a valid record content, or a default value

;; Input/Output
; get-field : String Record -> Maybe<Any>
; given a field name and a record, get the content if the record field name corresponds
; otherwise, return #false
; header :
; (define get-field name record) Maybe<Any>)

;; Examples
(check-expect (get-field "date" EX1-RECORD) "2012-02-12")
(check-expect (get-field "date" EX2-RECORD) #false)
(check-expect (get-field "number" EX3-RECORD) "17012003")

;; Template
; (define (get-field name record)
;   (cond [(empty? record)                             ...]                ; base case
;         [(string=? name (field-name (first record))) ... record ...]     ; match found
;         [else                                        (get-field ...)]))  ; still search

;; Code
(define (get-field name record)
  (cond [(empty? record) #false]
        [(string=? name (field-name (first record))) (field-content (first record))]
        [else (get-field name (rest record))]))

;** LIST -> RECORD ********************************************************************
;; Data types
; String
; List<String>
; Field
; Record

;; Input/Output
; list->record : List<String> List<String> -> Record
; given 2 ordered lists (names, contents), pair each item in fields and collect them in a Record
; header :
; (define (list->record los) Record)

;; Examples
(define EX1-LON (list "name" "surname" "birthday"))
(define EX1-LOC (list "Jeferson" "Morales Mariciano" "20020309"))
(define EX4-RECORD (list (make-field "name" "Jeferson")
                         (make-field "surname" "Morales Mariciano")
                         (make-field "birthday" "20020309")))
(check-expect (list->record EX1-LON EX1-LOC) EX4-RECORD)
(check-expect (list->record '() '()) '())

;; Template
; (define (list->record list-names list-contents)
;   (cond [(empty? list-names) ...]                                            ; base case
;         [else                (cons (make-field ...) (list->record ...))]))   ; pair name-content into fields

;; Code
(define (list->record list-names list-contents)
  (cond [(empty? list-names) '()]
        [else (cons (make-field (first list-names) (first list-contents))
                    (list->record (rest list-names) (rest list-contents)))]))

;** READ-CSV **************************************************************************
;; Data types
; String
; List<String>
; Field
; Record
; List<Record> is one of:
; - '()
; - (cons Record List<Record>)
; interpretation: list containing records got from CSV parsing

;; Input/Output
; read-csv : String -> List<Record>
; given a CSV file name, return the corresponding list of records
; header :
; (define (read-csv file-name) List<Record>)

;; Examples
(define EX1-LOR (list (list (make-field "date" "2012-02-12")
                            (make-field "carrier" "AA")
                            (make-field "number" "1176")
                            (make-field "origin" "MIA")
                            (make-field "destination" "BWI"))))
(define EX2-LOR (append EX1-LOR
                        (list (list (make-field "date" "2011-01-04")
                                    (make-field "carrier" "EV")
                                    (make-field "number" "5119")
                                    (make-field "origin" "ATL")
                                    (make-field "destination" "LEX")))))

; test first record
(check-expect (list (first (read-csv EXAMPLE-CSV)))
              EX1-LOR)
; test first and second record
(check-expect (list (first (read-csv EXAMPLE-CSV)) (second (read-csv EXAMPLE-CSV)))
              EX2-LOR)

;; Template
; (define (read-csv file-name)
;   (local [(define rows                ...)     ; get rows from CSV
;           (define list-field-names    ...)     ; get field names as List<String> from rows
;           (define list-content-rows   ...)]    ; get content rows as List<List<String>>
;     (map (λ (r) (list->record ... r)) ...)))   ; foreach content row, create a Record usign (list->record)

;; Code
(define (read-csv file-name)
  (local [(define rows (read-lines file-name))
          (define list-field-names (string-split (first rows) CSV-CHAR))
          (define list-content-rows (map (λ (r) (string-split r CSV-CHAR)) (rest rows)))]
    (map (λ (r) (list->record list-field-names r)) list-content-rows)))