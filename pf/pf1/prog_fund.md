# Programming fundamentals

## 1st lesson

racket programming language for programming well
programs design and redesign

how to program well:
correctness - security - robust - modular - efficient - concise - readable - stylish

Racket is functional programming language based on Scheme which is based on LISP.
Paradigms: imperative (procedural, OOP), functional, declarative

go ruby pascal swift kotlin scala
Book --> how to design programs
Grade = assignment 30%, project 30%, exam 40% + award 5% if help to improve
Days: monday, wednesday, friday
Swiss clock - 1 minute late and you are out

### 2nd lesson
expression = something to evaluate to get a value, ex. arithmetic expressions

```scheme 
(function arg1 arg2)	;	ex. (+ 2 5) or (myfunc 2 5)
```

`;` in racket means comment

data types definition = structured class or set of values which describe the data handled

booleans = bit but byte, (and a b) (or a b) (not a), logic operators

comparison between booleans --> `(= a b) (>= a b) (< a b)`

strings identified by quotation marks `"mystring"`, to append use `(string-append "hello" " world")	; >"hello world"`

(string-lenght s)

(string-ith s k)

(number->string k) string representation of n

comparison between same type and value `(equal? "this" (string-append "th" "is"))	;#true`

function are lowercase, usually have `?` at the end. Types have first capital letter.

predicate that check the type is usually `type?`

the type Image can be displayed, overlaid and modified by code. Just upload in the IDE and import `(require 2htdp/image)`

Definition --> constant definitions and 

Constant declared as `(define name expression)` 

function definition = `(define (function-name arg1 arg2 ...) expression)` as macros in C

**Assignment 1**

`(enter! mymodule.rkt)` to load rkt file in the same open directory and switch the evaluation context

Programs can be executed for windows with **raco** or for linux by adding `#! /usr/bin/env racket` to the beginning of the file.

`(printf "mystring")` to print strings in stdout.

`(if exp exp-true exp-false)` use it wisely!



## 3rd lesson

Feynman algorithm to solve problems:

write down the problem, think real hard, write down the solution

The design recipe: sequence of steps, analyze the problem and construct a solution in the form of a function.

Data: describe the data types to represent information

input/output: describe the function's signature, purpose and header (stub)

examples: function application

template: write a skeleton that highlights what relevant expressions can be used in the function's body

code: write good code

test: evaluate to check whether it behaves as expected `(check-expect (myfunc arg0) expected_out)`, always include corner cases. Then run. Always run when we write down the header to check syntax errors.

**The if expression** `(if condition then-expr else-expr)`

Program = collection of function and constant definitions. Executing a program means evaluating some of its functions with concrete inputs. batch and interactive programs. Batch, inputs are provided all at once before execution begins. Interactive, inputs are provided during an ongoing interaction while execution. Interactive programs have inputs available (event), that's why they are called event-driven. Function reacting to events are event-handlers. 

**the universe library** `(require 2htdp/universe)`.  use `(place-image args)`



## 4th lesson

cond (switch) vs if. It's important to use what's needed, moreover in racket because it depends the code readability.

**Enumeration**: to declare follow the design recipe and in the template write down the cond statement with the implementation.

**Intervals**: intervals between finite sequence of numbers. ex 1)n>50 2) 10 < n <= 50 3) n <50. Also a cond as enumeration but refined.

_IMPORTANT_ ternary function operators are widely supported, check for proof in documentation for better written code.

**Itemization**: generalizing of intervals and enumerations, list of items each of it can be interval, value or previously defined data type.

partial functions is a func that ca be defined only for some values of the input domain, strongly involves error handling. Maybe\<type> is what is called an uncertain output of a partial function that can be either the type or another kind of type.	

as

lllasust

5th lesson

## 5th lesson

Pair

user-defined structures: mak

## 6th lesson

refactoring= change the internal structure of a program that already works.

**make it work, make it right, make it fast**

pu

## 7th lesson

(error 'myfunc "mymessage")

preconditions --> requirements by commenting `; require:`

Backus-Naur form --> Backus was a pioneer designer of FORTRAN.

```scheme
<function def> ::= (define ((identifier) (identifier) ...) expression))
```

## 8th lesson

Lists

```scheme
'() ; this is an empty list
(cons "myelement" '()) ; this is an one-element list
(cons "Venus"
      (cons "Mars" '())) ; this is a two-element list
(first P1) ; accessing first element
(rest P1) ; accessing rest elements
(list? '()) ; boolean list type check
(empty? '()) ; ==#true
(cons? nel) ; ==#true non-empty list
```

operations 'first' and 'rest' are also called 'car' and 'cdr' because of the old nomenclature in LISP.

