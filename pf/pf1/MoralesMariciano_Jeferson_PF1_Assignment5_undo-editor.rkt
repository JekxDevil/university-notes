;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MoralesMariciano_Jeferson_PF1_Assignment5_undo-editor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; libraries for interactive programs and images
(require 2htdp/universe)
(require 2htdp/image)


; empty background
(define BACKGROUND (empty-scene 600 80))
; size of text
(define FONT-SIZE 40)
; color of text
(define FONT-COLOR "blue")
; picture of cursor
(define CURSOR (rectangle 7 FONT-SIZE "solid" "red"))


; An Editor is a structure:
;   (make-editor pre post)
; where:
;   pre, post: String
; interpretation: an editor whose visible text
; is (string-append pre post) and the cursor is
; between `pre` and `post`
(define-struct editor [pre post])

(define E1 (make-editor "hello " "world"))
(define E2 (make-editor "" ""))
(define E3 (make-editor "" "helloworld!"))
(define E4 (make-editor "helloworld!" ""))



#| Do NOT modify anything above this line |#
;************************************************************************************************
;************************************************************************************************
;;; APPLICATION STATE
;; Data Types
; UndoEditor is one of:
; - '()
; - (cons Editor UndoEditor)
; interpretation : a list of a chronological states of the Editor from most to least recent

;; Examples
(define UE1 (cons E1 '()))
(define UE2 (cons E2 (cons E1 '())))
(define UE3 (cons E3 (cons E2 (cons E1 '()))))
(define UE4 (cons E4 (cons E3 (cons E2 (cons E1 '())))))
(define UE5 (cons E4 (cons E1 (cons E2 (cons E1 '())))))
(define UE6 (cons E3 (cons E2 (cons E3 (cons E2 '())))))

;************************************************************************************************
;;; RENDERING
;; Data Types
; UndoEditor
; Image

;; Input/Output
; undo-render : UndoEditor -> Image
; given a list of states, render the most recent one
; header :
; (define (undo-render undo-editor) Image)

;; Examples
(check-expect (undo-render UE1)
              (overlay/align "left"
                             "center"
                             (beside (text "hello " FONT-SIZE FONT-COLOR) CURSOR (text "world" FONT-SIZE FONT-COLOR))
                             BACKGROUND))
(check-expect (undo-render UE2)
              (overlay/align "left"
                             "center"
                             (beside (text "" FONT-SIZE FONT-COLOR) CURSOR (text "" FONT-SIZE FONT-COLOR))
                             BACKGROUND))
(check-expect (undo-render UE3)
              (overlay/align "left"
                             "center"
                             (beside (text "" FONT-SIZE FONT-COLOR) CURSOR (text "helloworld!" FONT-SIZE FONT-COLOR))
                             BACKGROUND))
(check-expect (undo-render UE4)
              (overlay/align "left"
                             "center"
                             (beside (text "helloworld!" FONT-SIZE FONT-COLOR) CURSOR (text "" FONT-SIZE FONT-COLOR))
                             BACKGROUND))
;; Template
; (define (undo-render undo-editor)
;   (render ... undo-editor ...))

;; Code - used by (undo-run)
(define (undo-render undo-editor)
  (render (first undo-editor)))

;***********************************************************************************************
;;; KEY HANDLER
;; Data Types
; KeyEvent
; UndoEditor

;; Input/Output
; undo-edit : UndoEditor KeyEvent -> UndoEditor
; modify the editor in response to a key by returning to a previous state or editing the content
; header :
; (define (undo-edit undo-editor key-event) UndoEditor)

;; Constants
(define UNDO-CHAR "escape")

;; Examples
(check-expect (undo-edit UE1 UNDO-CHAR) (cons E1 '()))
(check-expect (undo-edit UE2 UNDO-CHAR) (cons E1 '()))
(check-expect (undo-edit UE3 UNDO-CHAR) (cons E2 (cons E1 '())))
(check-expect (undo-edit UE4 UNDO-CHAR) (cons E3 (cons E2 (cons E1 '()))))
(check-expect (undo-edit UE5 UNDO-CHAR) (cons E1 (cons E2 (cons E1 '()))))
(check-expect (undo-edit UE6 UNDO-CHAR) (cons E2 (cons E3 (cons E2 '()))))
(check-expect (undo-edit UE1 "\r") UE1)
(check-expect (undo-edit UE1 "\b") (cons (make-editor "hello" "world") (cons E1 '())))
(check-expect (undo-edit UE1 "a") (cons (make-editor "hello a" "world") UE1))

;; Template
; (define (undo-edit undo-editor key-event)
;   (cond [(string=? key-event UNDO-CHAR)                                                  ; if the edit want to undo and go one state back
;          (if [empty? (rest undo-editor)] [... undo-editor ...] [... undo editor ...])]   ; return the state unchanged if there is any
;         [else (if [equal? (first undo-editor) (edit (first undo-editor) key-event)]      ; otherwise
;                   ... undo-editor ...                                                    ; if the edit didn't change the state, keep current one
;                   [cons (edit ... undo-editor ... key-event) ... undo-editor ...])]))    ; else, save previous state and current one

;; Code - used by (undo-run)(self-powers ... )
(define (undo-edit undo-editor key-event)
  (cond [(string=? key-event UNDO-CHAR)
         (if [empty? (rest undo-editor)] undo-editor [rest undo-editor])]
        [else (cond [(equal? (first undo-editor) (edit (first undo-editor) key-event)) undo-editor]
                    [else (cons (edit (first undo-editor) key-event) undo-editor)])]))

;***************************************************************************************************
;;; MAIN FUNCTION
(define (undo-run undo-editor)
  (big-bang undo-editor
    [to-draw undo-render]
    [on-key undo-edit]))

;***************************************************************************************************
;***************************************************************************************************
#| Do NOT modify anything code below this line |#



; render : Editor -> Image
; display the editor's state as an image
; header: (define (render e) BACKGROUND)
(define (render e)
  (overlay/align "left" "center"
                 (beside (text (editor-pre e) FONT-SIZE FONT-COLOR)
                         CURSOR
                         (text (editor-post e) FONT-SIZE FONT-COLOR))
                 BACKGROUND))


;; Example
(check-expect (render E1)
              (overlay/align "left" "center"
                 (beside (text "hello " FONT-SIZE FONT-COLOR)
                         CURSOR
                         (text "world" FONT-SIZE FONT-COLOR))
                 BACKGROUND))
(check-expect (render E2)
              (overlay/align "left" "center"
                 (beside (text "" FONT-SIZE FONT-COLOR)
                         CURSOR
                         (text "" FONT-SIZE FONT-COLOR))
                 BACKGROUND))
(check-expect (render E3)
              (overlay/align "left" "center"
                 (beside (text "" FONT-SIZE FONT-COLOR)
                         CURSOR
                         (text "helloworld!" FONT-SIZE FONT-COLOR))
                 BACKGROUND))
(check-expect (render E4)
              (overlay/align "left" "center"
                 (beside (text "helloworld!" FONT-SIZE FONT-COLOR)
                         CURSOR
                         (text "" FONT-SIZE FONT-COLOR))
                 BACKGROUND))

; edit : Editor KeyEvent -> Editor
; modify editor `e` in response to `key` being pressed
; header: (define (edit e key) e)
(define (edit e key)
  (cond
    [(string=? key "\b")       (delete e)]     ; delete char at cursor
    [(string=? key "\r")       e]              ; no change
    [(string=? key "left")     (move-left e)]  ; move cursor left
    [(string=? key "right")    (move-right e)] ; move cursor right
    [(= (string-length key) 1) (insert e key)] ; insert `key` at cursor
    [else  e]))                                ; no change

(check-expect (edit E1 "X") (make-editor "hello X" "world"))
(check-expect (edit E1 "\r") E1)
(check-expect (edit E1 "\b") (make-editor "hello" "world"))
(check-expect (edit E1 "left") (make-editor "hello" " world"))
(check-expect (edit E1 "right") (make-editor "hello w" "orld"))
(check-expect (edit E2 "X") (make-editor "X" ""))
(check-expect (edit E2 "\b") E2)
(check-expect (edit E2 "left") E2)
(check-expect (edit E2 "right") E2)
(check-expect (edit E3 "X") (make-editor "X" "helloworld!"))
(check-expect (edit E3 "\b") E3)
(check-expect (edit E3 "left") E3)
(check-expect (edit E3 "right") (make-editor "h" "elloworld!"))
(check-expect (edit E4 "X") (make-editor "helloworld!X" ""))
(check-expect (edit E4 "\b") (make-editor "helloworld" ""))
(check-expect (edit E4 "left") (make-editor "helloworld" "!"))
(check-expect (edit E4 "right") E4)


;;; MAIN FUNCTION
; run : Editor -> Editor
(define (run e)
  (big-bang e
    [to-draw render]
    [on-key edit]))



;;; AUXILIARY FUNCTIONS

; delete : Editor -> Editor
; delete character to the left of cursor
; header: (define (delete e) e)
(define (delete e)
  (cond
    [(> (string-length (editor-pre e)) 0) ; non-empty pre:
                                          ; remove pre's last character
     (make-editor (remove-last (editor-pre e))
                  (editor-post e))]
    [else e]))

(check-expect (delete E1) (make-editor "hello" "world"))
(check-expect (delete E2) E2)
(check-expect (delete E3) E3)
(check-expect (delete E4) (make-editor "helloworld" ""))


; move-left : Editor -> Editor
; move cursor left by one character
; header: (define (move-left e) e)
(define (move-left e)
  (cond
    [(= (string-length (editor-pre e)) 0) e] ; cursor in leftmost position
    [else (make-editor
           (remove-last (editor-pre e))
           (string-append (last-character (editor-pre e))
                          (editor-post e)))]))

(check-expect (move-left E1) (make-editor "hello" " world"))
(check-expect (move-left E2) (make-editor "" ""))
(check-expect (move-left E3) (make-editor "" "helloworld!"))
(check-expect (move-left E4) (make-editor "helloworld" "!"))


; move-right : Editor -> Editor
; move cursor right by one character
; header: (define (move-right e) e)
(define (move-right e)
  (cond
    [(= (string-length (editor-post e)) 0) e] ; cursor in rightmost position
    [else (make-editor
           (string-append (editor-pre e)
                          (first-character (editor-post e)))
           (remove-first (editor-post e)))]))

(check-expect (move-right E1) (make-editor "hello w" "orld"))
(check-expect (move-right E2) (make-editor "" ""))
(check-expect (move-right E3) (make-editor "h" "elloworld!"))
(check-expect (move-right E4) (make-editor "helloworld!" ""))


; insert : Editor Character -> Editor
; add `char` to right of cursor, and move cursor after it
; header: (define (insert e char) e))
(define (insert e char)
  (make-editor
   (string-append (editor-pre e) char)
   (editor-post e)))

(check-expect (insert E1 "X") (make-editor "hello X" "world"))
(check-expect (insert E2 "Y") (make-editor "Y" ""))
(check-expect (insert E3 "a") (make-editor "a" "helloworld!"))
(check-expect (insert E4 "b") (make-editor "helloworld!b" ""))


; a NonemptyString is a String that is not ""
; intepretation: a string with at least one character

; remove-last : NonemptyString -> String
; remove last character of `s`
; header: (define (remove-last s) s)
(define (remove-last s)
  (substring s 0 (- (string-length s) 1)))

(check-expect (remove-last "a") "")
(check-expect (remove-last "abcde") "abcd")


; remove-first : NonemptyString -> String
; remove first character of `s`
; header: (define (remove-first s) s)
(define (remove-first s)
  (substring s 1 (string-length s)))

(check-expect (remove-first "a") "")
(check-expect (remove-first "abcde") "bcde")


; a Character is a String of length one
; intepretation: a single character of text

; last-character: NonemptyString -> Character
; last character of `s`
; header: (define (last-character s) "x")
(define (last-character s)
  (substring s (- (string-length s) 1) (string-length s)))

(check-expect (last-character "a") "a")
(check-expect (last-character "abcde") "e")


; first-character: NonemptyString -> Character
; first character of `s`
; header: (define (first-character s) "x")
(define (first-character s)
  (substring s 0 1))

(check-expect (first-character "a") "a")
(check-expect (first-character "abcde") "a")