# Atelier

## History

5 divisions:
- [? - ca 1900] : mechanics frist parts
- [ca 100 - ca 1970]
- [ca 1970 - ca 1990]
- [ca 1990 - ca 2000]
- [ca 2000 - now] : blockchain, ai, crypto

### The Dawn of Informatics

Hindu-arabic numeral system, positional decimal numeral system invented by Hindu mathematicians. Bramagupta invented 0.

_**Al-khwarizmi**_ persian mathematician invented the algorithms defined as unambiguos finite sequences of well-defined instructions. Invetor of algebra.

_**Leonardo Bonacci**_ aka Fibonacci. Liber Abaci (Book of Calculation) presented a number sequence later known as the Fibonacci sequence. Spred the Hindu-Arabic numeral system in Europe.

_**Da vinci**_ designed the first mechanical calculator, but couldn't build it. IBM did and it worked.

_**William Oughtred**_ slide rule to compute *, /, sqrt, ln. Invented sin, cos and 'x' symbols

_**Whilhelm Schickard**_ invented the first mechanical calculator called calculating clock, the machine is lost because of ww2 but the invention is documented.

_**Blaise Pascal**_ the programming language is not related to him. As teenager wrote a seminal essay on solid geometry and invented the pascaline, a mechanical adding machine to help his tax collector father. He was a genius (fluid dynamics, hydaulic press, probability theory, modern french prose style, Pascal triangles).

_**Lord Kelvin**_ absolute temperatures are stated in units of Kelvin. He established its corret value of absolute zero at -273.15C. Lord because of the atlantic cable. Kelvin Tide predictor simulated the gravitational pull of the moon on the earth.

_**Dorr Felt**_ Felt Comptometer, a mechanical table calculator. In 1915 the new model sold 42k units. First ever printing adding-machine.

### Machine learned to remember

_**Joseph Marie Jacquard**_ invented the first machine to store data in punch cards "Jacquard Loom".

_**Charles Babbage**_ Difference engine to compute polynomial functions, unnfinished. Originator of the concept of a programmable computer. The second machine was the Analytical Engine using punched cards to use them as input. Touring complete but was never built.

_Touring completeness in programming languages: Sequency, Branching (if else), Looping._

_**Ada Lovelace**_ known as the first computer programmer is credited with developing an algorithm for the AE to calculate a sequence of Bernoulli numbers.

_**George Boole**_ Author of "The Laws of Thought", boolean logic the basis of the modern digital computer. Operators: NOT (negation), AND (conjuction), OR (disjunction).

_**Herman Hollerith**_ Fathen of modern machine data processing, invented a mechanical tabulator based on punched cards, allowing him to tabulate statistics from millions of pieces of data. From 8 to 1 year of calculation Census. The Tabulating Machine Company later became the International Business Machines Corp (IBM).

~~**Antikythera**~~ an analog computer to predict astronomical positions and eclipses, dates 150-100 BC.

### Birth of Computers

_**Lee de Forest**_ 1906, accidentally discovered a mechanism to receive radio signals, the _Vacuum Tube_. Components for analog computers.

_**Eccles and Jordan**_ 1919 Latch Circuit, when an electrical signal is supplied to one of the inputs, the output state is reversed. One-bit memory device.

IBM multiplying punch. one of the firsts example of popular business machine, punched cars.

_**Alan Turing (1912 - 1954)**_

Gave a precise definition of computability. "Can machines think?" a formal essay. A and B are interrogated. C is the interrogator. If C can't state who is who, then the machine pass the test. 

During WWII, worked for the British governement at Bletchley Park to decrypt nazis Enigma machine used to send encrypted messages.

Touring machine can't be built because the tape provided to write in it is infinite. The automata remember the state of the machine, thus infinite memory. A program can't tell if another program's output is semantically correct. A program p2 that checks another program p1, just runs the input program p1 and wait, the result depends on the program p1, thus we will no be able to state if the program p1 runs forever or not.

_**Howard H.Aiken**_ (1900-1973). Behind IBM's Harvard Mark I computer, the ASCC (Automatic Sequence Controlled Calculator).

_**Claude Shannon**_ (1916). At MIT worked on maintaining the Differential Analyzer. While working at Bell Labs write what created later on Information Theory and inventor of the Bit as basic unit of information. Computers to solve complex problems. Use boolean algebra to design electrical circuits.

_**George Stibitz**_ model K was a model of an adder based on boolean logic. Done from kitchen wood.

ENIAC (Electronic Numerical Integrator and Computer), designed nuclear hydrogen bomb.

_**John Von Neumann**_ genius, Von Neumann architecture. Was in the team of nuclear scientist who bombed Japan. 

_**Grace Hopper**_ graduate with a PhD in mathematics from Yale , first programmer of the Harvard Mark I. Considered the inventor of the Compiler and COBOL (COmmon Business Oriented Language). Invented the "bug" terminology. 

**transistor** 1949, Bell Labs engineers invented the transfer resistor. Huge leap forward in computing. 

Sony was born in 1956 and used transistors.

Core Memory using magnets instead of vacuum tubs. 

Drum memory, ancestors of HDD with 1MB capacity.

_**Richard Hamming**_ Hamming Code: error detecting/correcting code. Punch cards used to read programs, but computers frequently made errors in reading. Hamming distance.

_Ferranti Mark I, Manchester 1951. Failure because 8 were sold. First computer to play chess._

_**John Backus**_, FORTRAN.

_IBM 305 RAMAC, first commercial computer to come with a hard disk drive as storage unit, 1956._

**Integrated Circuits** 1958 Jack Kilby at Texas Instruments, electronic handled calculator. Transistors to a miniature size.

_**Fred Brooks**_ project leader IBM system/360 (1964). Every program could run in any model of the system/360 family and the OS/360. He decided to switch the 6-bit byte to 8-bit byte, thereby enabling the use of lowercase letters.

_**Edsger W. Dijkstra**_ Structured Programming: write every possible program in Sequency, Iteration and Selection (Bohm-Jacopini Theorem).

_**John MacCarthy**_, founder of Artificial Intelligence he coined the term. LISP language.

1968

OS/360 challenge to accomplish. The OS had fundamental design flaws. _First software crisis_. US department of defense and NATO were worried about thier defense system. NATO organized a meet were the "Software Engineering" report was made. It stated the need of a methodology to construct software, stuctured programming advocacy.

_**Margaret Hamilton**_ (1969) 

Is software crisis solved nowadays? software is complex. the most complex of humans constructions.

1 error :

- every 20 lines (empirical)
- every 100 lines (well tested system)
- every 1000 lines (safety critical sw)every 10000 lines (utopia)

----

## Shell

File System : Abstraction for data storage and retrieval, organizes data in _directories_ and _files_

Absolute and Relative Paths.

username@nameofcomputer:/working/directory$

Help commands: man, whatis, info, apropos

basic commands:

- `pwd` --> path of working directory
- `ls` --> list directory contents
- `cd` --> change directory
- `mkdir` --> make directory
- `cp` --> copy files
- `mv` --> move files
- `rm` --> remove directory entries
- `file` --> determines the type of a file
- `cat` --> concatenate and print files
- `less`, `more` --> show file contents
- `head`, `tail` --> see first or last lines of a file
- `open` --> open the file with an application

Path shortcuts:

- '/' Root directory
- '.' Current directory
- '~' Home directory
- '..' Parent directory

Patterns (UNIX REGEX):

- '*' anything any length
- '?' any single character
- '[xy]' a given set of characters
- '[x-y]' a given range of characters
- '[!x]' not the set of charaters
- '{x1, ..., xn}' expanded to the range x1, x2, ..., xn

---

## LaTeX

Document Markup Language and a Document Preparation System designed by Leslie Lamport

Based on Tex, which is a typesetting system, designed by Donald Knuth

Advantages: large documents management, layout quality, features, openness, price

Isn't WYSIWYG (What You See Is What You Get)

.tex = pdf + .aux + .log

```latex
\documentclass[12pt]{article}
\usepackage{graphicx}
\title{} \author{} \date{}
\begin{document}
% comment
\maketitle
% document structure
% part > chapter > section > subsection > subsubsection > ... > paragraph > subparagraph > ...
% fonts
\emph{...}
\underline{...}
\textbf{...}
\texttt{...}
\textsf{...}
\textrm{...}
% font sizes
\tiny \scriptsize \footnotesize \small \normalsize \large \Large \LARGE \huge \Huge
% images
\begin{figure}[htbp]
    \includegraphics[width=.x\linewidth]{image.jpg}
    \caption{mycaption}
    \label{image:myimage}
\end{figure}
% tables
\begin{table}
\centering
    \begin{tabular}[|p{5cm}|c|r}
    	\hline
    	first & second & third \\
    	\hline
    	\multicolumn{3}{|c|}{wide text}
    \end{tabular}
\end{table}
% lists
\begin{itemize}
	\item myitem
	\item[--] another item
\end{itemize}
% enumerations
\begin{enumerate}
	\item this is shown as the first element
	\item this is shown as the second element
\end{enumerate}
% descriptions
\begin{description}
	\item[thetitle] the text of the description
	\item[anothertitle] another description of the other title
\end{description}
\end{document}
```

---

## HTML

Invented by Sir Tim Berners-Lee, proposed as a markup language for the WWW

HTML 5 --> Hyper Text Markup Language for describing web pages, the tags document the content. HTML documents are also called web pages.

```html
<!DOCTYPE html>
<html>
    <head>
        <!-- comment -->
        <title>my webpage title</title>
        <meta name="author" content="Jeferson"> <!-- attributes inside tags -->
        <meta name="keywords" content="HTML, CSS, JAVASCRIPT">
        <link>
        <script></script>
        <noscript></noscript>
        <base href="http://www.usi.ch/" target="_blank">
        <style></style>
    </head>
    <body>
        <p>Hello world!</p>
        <h1>BIG HEADER</h1>
        <h6>smallest header</h6>
        <a href="url">link text shown</a>
        <img src="url" width="123" height="123" alt="alt-text">
        <br> <!-- newline -->
        <hr> <!-- horizontal rule -->
        <!-- Other attributes: id, style, title, class -->
        <table border="1">
            <caption>caption to this table</caption>
            <tr>
            	<th>header 1</th>
                <th>header 2</th>
            </tr>
            <tr>
            	<td>content 1</td>
                <td>content 2</td>
            </tr>
        </table>
        <!-- unordered list -->
        <ul>
            <li>item1</li>
            <li>item2</li>
        </ul>
        <!-- ordered list -->
        <ol>
            <li>first item</li>
            <li>second item</li>
        </ol>
        <!-- description list -->
        <dl>
            <dt>description term title</dt>
            <dd>description data text</dd>
        </dl>
        <!-- text formatting tags -->
        <b>bold</b>
        <em>emphasized</em>
        <i>italic</i>
        <small>smaller text</small>
        <strong>important text also bolded</strong>
        <sub>subscripted text</sub>
        <sup>superscripted text</sup>
        <ins>inserted text</ins>
        <del>deleted text</del>
        <mark>marked/highlighted text</mark>
        <!-- computer output -->
        <code>code text</code>
        <kbd>keyboard data text</kbd>
        <samp>sample computer code</samp>
        <var>variable</var>
        <pre>preformatted text</pre>
        <abbr>abbreviation/acronym</abbr>
        <address>contact information for the author</address>
        <bdo>text direction</bdo>
        <blockquote>
            section quoted
        </blockquote>
        <q>quotation</q>
        <cite>citation</cite>
        <dfn>definition term</dfn>
        <!-- 
		< = &lt;
		> = &gt;
		& = &amp;
		-->
    </body>
</html>
```

Meta data provides information about the HTML document, will not be displayed on the page, but is machine parsable. It goes on the `<head>`.

Metadata can be used by browsers, search engines and other web services.

Use lowercase tags and attributes.

`<div>` is used as a block level container for grouping HTML elements

`<span>` is used as a inline element container for grouping HTML elements 
