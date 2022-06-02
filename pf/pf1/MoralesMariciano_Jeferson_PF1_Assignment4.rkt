;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MoralesMariciano_Jeferson_PF1_Assignment4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; Libraries
(require 2htdp/image)
(require 2htdp/universe)

;; Constants
(define WIDTH 500)
(define HEIGHT 500)
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define PEN (make-pen "red" 1 "solid" "round" "round"))
(define OFFSET 5)

; a Line is a structure (make-Line p1 p2)
; where p1 : Posn
;       p2 : Posn
; interpretation: a line is made of two points
(define-struct Line [startpoint endpoint])

; Maybe<Line> is one of:
; - a Line : the line is present
; - #false ; the line is missing
; interpretation: a line that may be missing

;;; Application State (AppState)
; AppState is a structure (make-AppState image line has-quitted)
;       image : Image
;        line : Maybe<Line>
; has-quitted : Boolean
; interpretation: the appstate describes what's seen and happening in the canvas
(define-struct AppState [image line hasquit])

;************************************** RENDERING ********************************************
;;; DRAW
;; Data Types
; AppState
; Image

;; Input/Output
; draw : AppState -> Image
; given an appstate, it returns the image of the canvas
; header:
; (define (draw appstate) Image)

;; Examples
(check-expect (draw (make-AppState BACKGROUND #f #f)) BACKGROUND)
(check-expect (draw (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 10 10)) #f))
                    (add-line BACKGROUND 0 0 10 10 PEN))

;; Template
; (define (draw appstate)
;   (if [Line? (... appstate ...)]
;       [add-line (... appstate ...)]
;       [... appstate ...]))
  
;; Code -- used by (big-bang -> to-draw)
(define (draw appstate)
  (if [Line? (AppState-line appstate)]
      [add-line (AppState-image appstate)    ; if there is a line, draw the image
                (posn-x (Line-startpoint (AppState-line appstate)))
                (posn-y (Line-startpoint (AppState-line appstate)))
                (posn-x (Line-endpoint (AppState-line appstate)))
                (posn-y (Line-endpoint (AppState-line appstate)))
                PEN]
      (AppState-image appstate)))            ; else return image unchanged

;*********************************** MOVING POINT ***********************************
;;; MOVE-END
;; Data Types
; AppState
; Number

;; Input/Output
; move-end : AppState Number Number -> AppState
; given the appstate and coords x,y of the cursor, change the line endpoint
; to the new coords if the line exist, else return the appstate
; header :
; (define (move-end appstate new-x new-y) AppState)

;; Examples
(check-expect (move-end (make-AppState BACKGROUND #f #f) 0 0)
              (make-AppState BACKGROUND #f #f))
(check-expect (move-end (make-AppState BACKGROUND (make-Line (make-posn 2 2) (make-posn 3 3)) #f)
                        0 0)
              (make-AppState BACKGROUND (make-Line (make-posn 2 2) (make-posn 0 0)) #f))

;; Template
;(define (move-end appstate new-x new-y)
;  (if [Line? (... appstate ...)]
;      [... appstate ...]
;      [... appstate ...]))

;; Code  -- used by (handle-mouse)
(define (move-end appstate new-x new-y)
  (if [Line? (AppState-line appstate)]
      [make-AppState (AppState-image appstate)
                     (make-Line (Line-startpoint (AppState-line appstate))
                                (make-posn new-x new-y))
                     (AppState-hasquit appstate)]
      appstate))

;**********************************************************************************
;;; MOVE-START
;; Data Types
; AppState
; Number

;; Input/Output
; move-start : AppState Number Number -> AppState
; given the appstate and coords x,y of the cursor, change the line startpoint and
; endpoint to the new coords if the line exist in order to start drawing it, otherwise return the appstate
; header :
; (define (move-start appstate new-x new-y) AppState)

;; Examples
(check-expect (move-start
               (make-AppState BACKGROUND (make-Line (make-posn 2 2) (make-posn 3 3)) #f)
               0 0)
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 0 0)) #f))

;; Template
; (define (move-start appstate new-x new-y)
;   (... appstate ...))

;; Code -- used by (handle-mouse)
(define (move-start appstate new-x new-y)
      (make-AppState (AppState-image appstate)
                     (make-Line (make-posn new-x new-y)
                                (make-posn new-x new-y))
                     (AppState-hasquit appstate)))

;**********************************************************************************
;;; ADD-LINE-TO-CANVAS
;; Data Types
; AppState

;; Input/Output
; add-line-to-canvas : AppState -> AppState
; given an appstate, add to the canvas image the line and reset to #false the line
; header :
; (define (add-line-to-canvas appstate) AppState)

;; Examples
(check-expect (add-line-to-canvas (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
              (make-AppState (add-line BACKGROUND 0 0 1 1 PEN) #f #f))
(check-expect (add-line-to-canvas (make-AppState BACKGROUND #f #f))
              (make-AppState BACKGROUND #f #f))

;; Template
; (define (add-line-to-canvas appstate)
;   (if [Line? (... appstate ...)]
;       [... appstate ...]
;       [... appstate ...]))

;; Code -- used by (draw)
(define (add-line-to-canvas appstate)
  (if [Line? (AppState-line appstate)]
      [make-AppState (add-line (AppState-image appstate)
                               (posn-x (Line-startpoint (AppState-line appstate)))
                               (posn-y (Line-startpoint (AppState-line appstate)))
                               (posn-x (Line-endpoint (AppState-line appstate)))
                               (posn-y (Line-endpoint (AppState-line appstate)))
                               PEN)
                     #false
                     (AppState-hasquit appstate)]
      appstate))

;*********************************** CANCEL LINE ***********************************
;;; CANCEL-LINE
;; Data Types
; AppState

; Input/Output
; cancel-line : AppState -> AppState
; given an appstate, if there is a line being drawn, it cancels it
; header :
; (define (cancel-line appstate) AppState)

;; Examples
(check-expect (cancel-line (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
                           (make-AppState BACKGROUND #f #f))
(check-expect (cancel-line (make-AppState BACKGROUND #f #f))
                           (make-AppState BACKGROUND #f #f))

;; Template
; (define (cancel-line appstate)
;   (... appstate ...))

;; Code -- used by (handle-key)
(define (cancel-line appstate)
  (if [Line? (AppState-line appstate)]
      [make-AppState (AppState-image appstate) #false (AppState-hasquit appstate)]
      appstate))

;************************************* QUITTING *********************************************
;;; QUIT
;; Data Types(
; AppState

;; Input/Output
; quit : AppState -> AppState
; given an AppState, it quits the app by changing the correspondent value in the appstate that records it
;; header :
; (define (quit appstate) AppState)

;; Examples
(check-expect (quit (make-AppState BACKGROUND #f #f)) (make-AppState BACKGROUND #f #t))
(check-expect (quit (make-AppState BACKGROUND #f #t)) (make-AppState BACKGROUND #f #t))

;; Template
; (define (quit appstate)
;   (... appstate ...))

;; Code -- used by (handle-key)
(define (quit appstate)
  (make-AppState (AppState-image appstate) (AppState-line appstate) #true))

;******************************* MOUSE HANDLER ***************************************************
;;; HANDLE-MOUSE
; Data Types
; AppState
; Number
; MouseEvent is represented via String
; interpretation : MouseEvent is an event triggered by a mouse action passed in String

; Input/Output
; handle-mouse : AppState Number Number MouseEvent -> AppState
; the following mouse input events are handled
; where "button-down" : start drawing a line
;              "drag" : move the current line's end point
;         "button-up" : add the current line to the canvas
; header :
; (define (handle-mouse appstate mouse-x moyse-y key) AppState)

;; Example
(check-expect (handle-mouse (make-AppState BACKGROUND #f #f) 0 0 "button-down")
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 0 0)) #f))
(check-expect (handle-mouse (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 0 0)) #f) 1 1 "drag")
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
(check-expect (handle-mouse (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 5 5)) #f) 5 5 "button-up")
              (make-AppState (add-line BACKGROUND 0 0 5 5 PEN) #f #f))
(check-expect (handle-mouse (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f) 7 7 "enter")
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))

;; Template
; (define (handle-mouse appstate mouse-x mouse-y key)
;   (cond [(mouse=? key "button-down") (... appstate ...)]
;         [(mouse=? key "drag")        (... appstate ...)]
;         [(mouse=? key "button-up")   (... appstate ...)]
;         [else                        (... appstate ...)]))

;; Code -- used by (big-bang -> on-mouse)
(define (handle-mouse appstate mouse-x mouse-y key)
  (cond [(mouse=? key "button-down") (move-start appstate mouse-x mouse-y)]
        [(mouse=? key "drag") (move-end appstate mouse-x mouse-y)]
        [(mouse=? key "button-up") (add-line-to-canvas appstate)]
        [else appstate]))

;********************************* KEY HANDLER *************************************************
;;; SHIFT-LEFT
;; Data Type
; AppState

;; Input/Output
; shift-left : AppState -> AppState
; move the line's initial point by +5 pixels left
; header :
; (define (shift-left appstate) AppState)

;; Examples
(check-expect (shift-left (make-AppState BACKGROUND (make-Line (make-posn 5 0) (make-posn 1 1)) #f))
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
(check-expect (shift-left (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))

;; Template
; (define (shift-left appstate)
;  (... appstate ...))

;; Code -- used by (handle-key)
(define (shift-left appstate)
  (if [and (Line? (AppState-line appstate))   ; without the app crashes (no-Line and out-of-bound)
           (>= (- (posn-x (Line-startpoint (AppState-line appstate))) OFFSET) 0)]
      [make-AppState (AppState-image appstate)
                     (make-Line (make-posn (- (posn-x (Line-startpoint (AppState-line appstate))) OFFSET)
                                           (posn-y (Line-startpoint (AppState-line appstate))))
                                (Line-endpoint (AppState-line appstate)))
                     (AppState-hasquit appstate)]
      appstate))

;************************************************************************************************
;;; SHIFT-RIGHT
;; Data Type
; AppState

;; Input/Output
; shift-right : AppState -> AppState
; move the line's initial point by +5 pixels right
; header :
; (define (shift-right appstate) AppState)

;; Examples
(check-expect (shift-right (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
              (make-AppState BACKGROUND (make-Line (make-posn 5 0) (make-posn 1 1)) #f))
(check-expect (shift-right (make-AppState BACKGROUND (make-Line (make-posn WIDTH 0) (make-posn 1 1)) #f))
              (make-AppState BACKGROUND (make-Line (make-posn WIDTH 0) (make-posn 1 1)) #f))

;; Template
; (define (shift-right appstate)
;  (... appstate ...))

;; Code -- used by (handle-key)
(define (shift-right appstate)
  (if [and (Line? (AppState-line appstate))      ; without the app crashes (no-Line and out-of-bound)
           (<= (+ (posn-x (Line-startpoint (AppState-line appstate))) OFFSET) WIDTH)]
      [make-AppState (AppState-image appstate)
                     (make-Line (make-posn (+ (posn-x (Line-startpoint (AppState-line appstate))) OFFSET)
                                           (posn-y (Line-startpoint (AppState-line appstate))))
                                (Line-endpoint (AppState-line appstate)))
                     (AppState-hasquit appstate)]
      appstate))
;************************************************************************************************
;;; SHIFT-UP
;; Data Type
; AppState

;; Input/Output
; shift-up : AppState -> AppState
; move the line's initial point by +5 pixels up
; header :
; (define (shift-up appstate) AppState)

;; Examples
(check-expect (shift-up (make-AppState BACKGROUND (make-Line (make-posn 0 5) (make-posn 1 1)) #f))
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
(check-expect (shift-up (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))

;; Template
; (define (shift-up appstate)
;  (... appstate ...))

;; Code -- used by (handle-key)
(define (shift-up appstate)
  (if [and (Line? (AppState-line appstate))      ; without the app crashes (no-Line and out-of-bound)
           (>= (- (posn-y (Line-startpoint (AppState-line appstate))) OFFSET) 0)]
      [make-AppState (AppState-image appstate)
                     (make-Line (make-posn (posn-x (Line-startpoint (AppState-line appstate)))
                                           (- (posn-y (Line-startpoint (AppState-line appstate))) OFFSET))
                                (Line-endpoint (AppState-line appstate)))
                     (AppState-hasquit appstate)]
      appstate))
;************************************************************************************************
;;; SHIFT-DOWN
;; Data Type
; AppState

;; Input/Output
; shift-down : AppState -> AppState
; move the line's initial point by +5 pixels down
; header :
; (define (shift-down appstate) AppState)

;; Examples
(check-expect (shift-down (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
              (make-AppState BACKGROUND (make-Line (make-posn 0 5) (make-posn 1 1)) #f))
(check-expect (shift-down (make-AppState BACKGROUND (make-Line (make-posn 0 HEIGHT) (make-posn 1 1)) #f))
              (make-AppState BACKGROUND (make-Line (make-posn 0 HEIGHT) (make-posn 1 1)) #f))

;; Template
; (define (shift-down appstate)
;  (... appstate ...))

;; Code -- used by (handle-key)
(define (shift-down appstate)
  (if [and (Line? (AppState-line appstate))       ; without the app crashes (no-Line and out-of-bound)
           (<= (+ (posn-y (Line-startpoint (AppState-line appstate))) OFFSET) HEIGHT)]
      [make-AppState (AppState-image appstate)
                     (make-Line (make-posn (posn-x (Line-startpoint (AppState-line appstate)))
                                           (+ (posn-y (Line-startpoint (AppState-line appstate))) OFFSET))
                                (Line-endpoint (AppState-line appstate)))
                     (AppState-hasquit appstate)]
      appstate))
;************************************************************************************************
;;; HANDLE-KEY
;; Data Types
; AppState
; KeyEvent is represented via String
; interpretation : KeyEvent is an event triggered by the key pressed on the keyboard passed in String

;; Input/Output
; handle-key : AppState KeyEvent -> AppState
; the following key input events are handled
; where "escape" : cancel the currently drawn line
;            "q" : set the app's state to quit
;         "left" : move the line's initial point by +5 pixels left
;        "right" : move the line's initial point by +5 pixels right
;           "up" : move the line's initial point by +5 pixels up
;         "down" : move the line's initial point by +5 pixels down
; header :
; (define (handle-key appstate key) AppState)

;; Examples
(check-expect (handle-key (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f) "q")
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #t))
(check-expect (handle-key (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f) "escape")
              (make-AppState BACKGROUND #f #f))
(check-expect (handle-key (make-AppState BACKGROUND (make-Line (make-posn 5 0) (make-posn 1 1)) #f) "left")
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
(check-expect (handle-key (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f) "right")
              (make-AppState BACKGROUND (make-Line (make-posn 5 0) (make-posn 1 1)) #f))
(check-expect (handle-key (make-AppState BACKGROUND (make-Line (make-posn 0 5) (make-posn 1 1)) #f) "up")
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))
(check-expect (handle-key (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f) "down")
              (make-AppState BACKGROUND (make-Line (make-posn 0 5) (make-posn 1 1)) #f))
(check-expect (handle-key (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f) "print")
              (make-AppState BACKGROUND (make-Line (make-posn 0 0) (make-posn 1 1)) #f))

;; Template
; (define (handle-key appstate key)
;   (cond [(key=? key "q")      (... appstate ...)]
;         [(key=? key "escape") (... appstate ...)]
;         [(key=? key "left")   (... appstate ...)]
;         [(key=? key "right")  (... appstate ...)]
;         [(key=? key "up")     (... appstate ...)]
;         [(key=? key "down")   (... appstate ...)]
;         [else                 (... appstate ...)]))

;; Code -- used by (big-bang -> on-key)
(define (handle-key appstate key)
  (cond [(key=? key "q") (quit appstate)]
        [(key=? key "escape") (cancel-line appstate)]
        [(key=? key "left") (shift-left appstate)]
        [(key=? key "right") (shift-right appstate)]
        [(key=? key "up") (shift-up appstate)]
        [(key=? key "down") (shift-down appstate)]
        [else appstate]))

;*************************** TERMINATION HANDLER ********************************************
;;; QUIT?
;; Data Types
; AppState

; Input/Output
; quit? : AppState -> Boolean
; takes an appstate and returns a bool indicating whether the app has quit or not
; header :
; (define (quit? appstate) Boolean)

;; Examples
(check-expect (quit? (make-AppState BACKGROUND #f #f)) #f)
(check-expect (quit? (make-AppState BACKGROUND #f #t)) #t)

;; Template
; (define (quit? appstate)
;   (... appstate ...))

;; Code -- used by (big-bang -> quit?)
(define (quit? appstate)
  (AppState-hasquit appstate))

;**********************************************************************************
;;; MAIN - BIG BANG
(define (drawing-app initial-state)
  (big-bang initial-state
    [to-draw draw]
    [on-mouse handle-mouse]
    [on-key handle-key]
    [stop-when quit?]))

(drawing-app (make-AppState BACKGROUND #false #false))