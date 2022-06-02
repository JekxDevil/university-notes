# Computer Architecture

## 1 Lesson



## 2 Lesson

The Analytical Engine 1834 build the neverfully completed computer with wood to print.

Zuse's Z1 1936 used binary, was purely mechanical but electrically driven. Programs were stored as 8-bit binary code on old film rolls.

War helped computer development to calculate the right

Harvard Mark I, 1944, used decimal system.

ENIAC 1946 first fully digital computer, used 18k vacuum tubes and consumed 150kW of power.

IBM 608, 1955, first all-transistorized calculator mean for the commercial market.

The IBM PC, 1981, first personal computer.

Personal Digital Assistants or PDAs as the Apple iPhone 2007 or the first PDA known the PalmPilot (1997) or the Apple Newton (1993) or Google Glass (2013).

**Moore's Law**

The first transistor was build in 1947 by Shockley, Bardeen and Brattain at Bell Labs.

Gordon E. Moore stated that home computers and personal portable communications equipment will be available sooner than expected because of the increasing of transistors in circuits. Moore revisited his law by changing that the complexity will double every couple of years instead of each year.

Moore's Law apply not only for transistor, but for computing: RAM, storage space, bandwidth (battery capacity excluded).

CPU get faster, almost 50% per year, while other components no, ex. RAM.

## 3 Lesson

Recap: history of computers

Mechanical --> electro-mechanical --> electric

Vacuum tubes --> transistors

Calculator --> data processor

Moore's Law not really a law. The Computer Spectrum: disposable computer, microcontroller, game computer, personal computer, server, mainframe. Nm and manufacturing process. ARM - Advance RISC Machine, developed by Acorn Computers UK in 1985. Apple asked Acorn for CPU for its Newton. Acorn doesn't build CPUs, just designs theme and licenses to others (snapdragon, Axx, Exynos, Tegra). Atmel AVR microcontroller (Alf's and Vegard's RISC processor) designed by two Norwegian students based on Harvard architecture. Arduino, open source mini-computer designed by Massimo Banzi at Interaction Design Institute Ivrea in Italy.

**Abstraction**: simplify and eliminate irrelevant detail. ex from person to stickman. The inverse process is **concretization**. 

A single transistor implement a not gate, but also vacuum tube, a relay, a lego brick...

Abstract multilevel machine: level-0 programs are directly executed by electronic circuits, level-n are either interpreted by an interpreter running on a lower machine, or are translated to an under level machine language Ln.

Contemporary multilevel machines: level-0 digital logic level --> hardware --> microarchitecture level-1 --> interpretation or direct execution --> instruction set architecture level-2 --> partial interpretation OS --> operating system machine level-3 --> assembler translation --> assembly language level-4 --> compiler translation --> problem-oriented language level

ISA instructions vs microinstructions vs assembly. 

Assembly = LOAD R2 19; ISA instructions 1 000 0001 0 10 10011; micro-instruction 00 00 00 1010 10 10011. Assembly --> assembler --> Instruction interpreter --> interpretation.

## 4 Lesson

### Processors

#### Control Unit

part of CPU, runs program following the three steps _Fetch, Decode, Execute_.

Key parts: 

- Program Counter (PC, keeps track of next instruction), also called Instruction Pointer (IP)

- Instruction Decoder (converts command to microinstruction, which directly controls "signals")

Data follows the data path. Knob and switch computer shows it.

Control flow on the pipeline:

- PC/IP points to the currently executing instruction

- Instruction Register (IR) contains a copy of the currently executing instruction.

Fecth-Decode-Execute:

1) Fetch next instruction from memory to IR (IFU)

2) Change PC to point to following instruction

3) Determine type of instruction fetched (IDU) (OFU)

4) If instruction uses data from memory
   - Load memory content into a CPU register
5) Execute instruction (IEU) (WBU)
6) goto step1



RISC vs CISC

Complex Instruction Set Computer. Large # of complex instructions. ISA instruction are broken down to multiple simple microinstructions.

Reduced Instruction Set Computer. Small # of simple instructions. Coined by Patterson/Sequin at UC Berkeley. ISA instruction correspond to a microinstruction. Only load and store go to memory instead of funky add functions that can access it.

#### Maximize Instruction Issue Rate

do more at the same clock-speed, minimize waiting time, especially to/from memory.

* Instruction-Level Parallelism (ILP)
* Processor-Level Parallelism (PLP)

superscalar architecture

Data Parallel Computers: same instruction applied to many elements. The way pipelines are made change the way thy are specialized to do certain operations, as for the GPUs.

## 5th Lesson

less significant bit and most significant bit = think about your bank account

Bin to Dec -> _Conversion using successive doubling_!

Dec to Bin -> _Conversion using successive_ halving

Negative numbers:

- Signed Magnitude -> use most significant bit (MSB) to hold sign (0 = '+', 1 = '-') and shorten length. Has two zeros.
- Two's Complement -> signed, if positive leave it, if not invert all digits and add '1'. If 2 operands in sum have the same sign and the result is of the opposite sign, an overflow occurred.

* Excess 2^(m-1) representation: offset representation with values shift (ex 8 bits -> -128 = 00000000)

The basic cell size-> a Byte 8 bit size which in ASCII format needed 7 bits + the 8th bit for error connection.

Meta grouping the cells -> words are composed by 4 Bytes. 

## 6th Lesson

...

**Difference between Gigabytes and Gibibytes**

the powers of 10 (scientific notation) vs in computing we use power of 2.

Little Endian vs Big Endian:

Comes from Gullivers Travels.

- Little Endian: start with least significant Byte
- Big Endian: start with most significant Byte

Memory optimization is know to be efficient by working with words. But if memory unaligned access occurs, it may slower the programs because of data in multiple or incomplete discontinous words.

Memory word + Redundancy error checking = Code Word

Parity Bit = calculated by finding if we might add or not a 1 to get an even amount of 1's. Detect a single bit flip, can't detect even and is confusing with n>1 bit flips.

3 bit for 'm' memory and 1 bit for 'r' redundancy give a a codeword word.

Richard Hamming (1915-1998), founder of ACM (Association for Computer Machinery). 

#### Hamming Code

Specific Error-Correcting Code that is able to correct a single error. 

It builds up by putting the data in positions which are not powers of two and the corrective bits in the power of 2 positions. Then the first check bit calculate the bit parity of all data except power of 2's positions. Then the second check bit calculate the bit parity of all data except power of 2 and the first bit and so on. 

#### Hamming Distance

Metric of a generic Error Correcting Code that describes its error detection and correcting capabilities. Calculate the bitflips between codes, then we get the MIN(#bitflips between any two words).

## 7th Lesson

Caches:

Register to register is fast

register to memory instruction is slow

Memory wall => a big problem. Every 5th executed instruction is a load. Memory loads take around 350 cycles and load latency impacts overall performance.

For speeding up data access, we exploit spatial & temporal address locality. Loading sequences of words.

Caches is not cool as the registers. To read not 1 cycle as register but 5, instead of 350 cycles of memory.

CPU doesn't handle or ask memory anymore, instead this work is done by the cache. The cache basically guess what words you may need. 

Mean access time = c + (1-h) m.	With h = cache hit ratio, c = cache access time, m = memory access time

*funny: cache L1 says to cache L2 have you got this data? No, wait a second, im gonna have it. Mh, actually not a second, a nanosecond*

cache only instructions usually separated caches for data.

4, 20, 40 is the law to registers L1, L2, L3 and memory

Memory hierarchy --> registers, cache, main memory, magnetic disk, tape/optical disk

Sector Organization --> conventional (same # sector in each track) or zone

Increasing Density: 

- magnetic coercivity
- field strength of write head
- field size generated by write head

## 8th Lesson

Increasing Density II (2013-) --> shingled magnetic recording - SMR

the read head is smaller than write head : 

- write process must ensure proper magnetization
- leads to wasted space between tracks

overlapping track writing leads to smaller read track size:

- problem: changes overwrite adjacent track

- solution: arrange multiple track in bands and sequentially re-write singled tracks

Increasing density III (2021?) --> Thermally-Assisted Recording

**RAID**

RAID 0 --> striping (no Redundancy). Split pieces of data in disks to read and write faster as many disk you have. 

RAID 1 --> Redundancy, increased fault tolerance. Every time I write, I do it twice in a mirror disk. No storage advantage. 

RAID 2 --> Interleaved

RAID 3 --> bit

RAID 4 --> striping with parity on dedicated drive who holds checksum

RAID 5 --> distributed striped parity information ! _what is and why is better than 4_

RAID 6 --> "P+Q RAID". use two disks to keep parity information, can tolerate second disc failure

RAID 7.N --> 'N' stands for the number of parity disks the raid has

mean time before failure MTBF = cumulative hours of all disks / number of disks failed

annualized failure rate AFR = cumul. hours _p.a._ / MTBF

## 9th Lesson

**text representation**

ASCII (7 bit)

ISO 8859 (8 bit) set of characters in different global regions

UNICODE (16 bit)

tty 

back in the days with ASCII, there were no monitors.

UCS tanfromation format (UTF-8) --> variable length encoding

BUS. wires that connect devices

different buses on the same mainboard not related to core system components:

- AGP old graphic cards
- PCI Bus
- PCI-Express
- ISA-Slots

Bus issues :

- Arbitration

- DMA (direct memory access -> non-CPU devide talks to RAM) 

- Interrupts (device notifies CPU that something happened)

Early on there was a single bus, now we use multi-bus architecture (Nothern and Southern bus)

PCI-Express :

It's technically not a bus, but a direct connection to each device (switched), point-to-point topology

Serial, not parallel --> 1 lane (x1) = 1bit bus || x16 = 16 bit bus

**CHAPTER 3**

Gates and boolean algebra

representation of boolean function : from algebraic function --> truth table --> Karnaugh Map --> circuit design

| not                                             | nand                                             | nor                                               | and  | or    |
| ----------------------------------------------- | ------------------------------------------------ | ------------------------------------------------- | ---- | ----- |
| <span style="text-decoration:overline">a</span> | <span style="text-decoration:overline">ab</span> | <span style="text-decoration:overline">a+b</span> | ab   | a+b   |
| a'                                              | (ab)'                                            | (a+b)'                                            | (ab) | (a+b) |

Completeness of NAND and NOR

- all basic gates can be built from a single type, using either AND or only NOR gates
- because they are functionally complete, i.e. can be used to express all possible truth tables

 A single transistor is a NOT gate.

NAND and NOR are used because the cost to build gates from transistor is less. It costs 2 gates to build NAND/NOR, instead of 3 requiered to build AND/OR.

## 10th Lesson

Representation of Boolean functions:

**truth table**

for n inputs there are 2^n outputs --> for 2 inputs there are 2^2 = 4 outputs

arity = number of arguments:

- 0 --> constants 
  - pi
  - TRUE
- 1 --> one input, one ouput 
  - sin(x)
  - cos(x))
- 2 --> two inputs
  - a+b
  - a OR b

example shown: f(a,b) = a'b + ab

|  A   |  B   | OUT  |
| :--: | :--: | :--: |
|  0   |  0   |  0   |
|  0   |  1   |  1   |
|  1   |  0   |  0   |
|  1   |  1   |  1   |

mintems m0 m1 m2 m3:

- a'b
- ab

mintems: look for 1s and use AND. Writing out the formula give us the disjunctive normal form.

translate into formality about when it's true the output

maxterms: look for 0s intead and use OR. Writing out the formula give us the conjuctive normal form.

maxterms in ex. m0 m1 m2 m3 :

- a+b
- a'+ b

minterms and maxterms are functionally equivalent and in the example both mean f(a,b).

**Karnaugh map**

assume you have the truth table and place its output to the map. First top left letters are underlined to indicates the element is true.

   a *a'*

b  1 1

*b'*0 0

In this rectangle what values stay the same? b. So the function can be simplified by f(a,b) = b.

max 4 inputs without going to 3rd dimension map.

Group in rectangles the 1s into 2^n sizes covering all 1s. Then for each rectangle simplify by writing down what element stays still and leave out which changes.

We can choose between minterms (usual approach) or maxterms. We get respectevely the Disjunctive form or Conjunctive form because of lack of minterms and maxterms expansion.

We find out minimal sum of F through prime elements. There are Essential Prime Implicants necessary to group all 1s.

"Don't Cares" : for inputs with output we will never use, ex count 0-9 with 4 bits, set the output as 'D' = Don't Care. This simplifies a lot Karnaugh Maps.

## 11th Lesson

...

clock and subcycles --> combine overlapping clocks to obtain with gates clock with faster frequencies

**memory**

retain information over time

Non-volatile 

- magnetic fields: hard disk, tape
- electric charge: ssd, flash memory EEPROM

Volatile

- electric charge: DRAM (dynamic RAM)
- using feedback: SRAM (static RAM) [faster and expensive]

Circuit with feedback: 

Q----|>o-----Qnext
																		|------|
if we connect directly Q-Qnext it becomes unstable.				Q------|>o-----Qnext

Q---|>o-----|>o----Qnext with Q-Qnext connected becomes stable

S = store 1; R = store 0; Q = state of memory;

The SR-Latch

gate delay

solution --> clocked SR Latch

we prepare the signal to be put on the Latch and then we activate the clock put in OR gates to time the rythm of signal's travel.

Clocked D Latch --> S and R are basically the same but opposite purpose. Just use a D that split in two inputs: one true and the other negated to false.

Flip-Flop ---> instead of level-triggered, it is edge triggered. Have the minimum amount of time to reset or set memory, reducing at best race conditions.

chip select = used when there are many chips to select which is being used.

tri-state outputs = had data in, control line, data out. If control line is true, then the data in can be read.

## 1*th Lesson

Implementing the IJVM machine

we are looking at 3 levels simultaneously

stack, indirect addresses

isa level is not register based, that is a matter of the microinstrinstruction

every instruction in java bytecode is 1 byte. there are an order of 256 instructions

the operands come in other bytes.MBR holds a single byte, Memory bytecode register

most significant bit (MSB)

in K^S one instruction required only one microinstruction RISC architecture

CIS 1 ISA --> multiple microinstructions



we implement the IJVM in functions as subrouting,

compilation translate all the instructions of the real program in ISA instructions

translation happens in realtime

micro instruction register hols al, c, m, b

we are developing cisc based isa instructiontranslation to microinstruction (microprogram)

MAL micro assembly language

instructions vs assembly:

- ISA assembly language and ISA instructions
- Micro assembly language (MAL) and microinstructions

bit shifting to left for multiplicate by 2, the inverse to divide by 2

 

## ? Lesson

Java Assembly Language

opcode 1 byte : 0xac

mnemonic: ireturn

stack for variables

call stack to track places where the pc should and had jumped before, manage return calls on subroutines when finished

LV=local variable register, points to address or index to which continue

each instance of the call stack contain return address, parameters passed and makes space to local variable of the subroutine called 



## ?? Lesson

last week: call stack, operand stack

Memory:

- Heap
- Stack (LV < SP)
- Constant Pool (CPP)
- Method Area (PC)

Extended backus-naur form tells if an instructin in well formaly composed for a computer

TOS = Top Of Stack

## lab

fetch - instructions - uses PC for reference - method area

read - data - uses MAR (MEMORY ADDRESS REGISTER) for reference - stack is where data i

MBR is used as output by instructions by op codes

MDR is used as output by data operations

write - stack - read from MDR - write to MAR (which is usually SP+1) in order to create a new empty space for data

sp keeps address of the top of the stack

tos keeps the values of the top of the stack

microinstructions are stored in **micro store**
