# Tricky Triangle

![Tricky Triangle Board](https://i5.walmartimages.com/asr/837d80d8-f5d5-4559-bb83-733e7e3e75da_1.2b183c35f5dc64ee19a5b365f6780132.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF)

Tricky Triangle is a solitare peg game where you must eliminate pegs from the board by jumping over them. The object of the game is to remove as many pegs as possible before you run out of moves.

## Gameplay

The board is an equilateral triangle, so all sides are the same length, with the standard Tricky Triangle board size being 5-5-5. All of the holes are occupied with the exception one, usually the top. For this board below, the •'s represent pegs and the o represents the empty hole.

```
        o
      •   •
    •   •   •
  •   •   •   •
•   •   •   •   •
```

In order to eliminate a peg from the board, you have to locate three pegs in a line, with two adjacent occupied pegs and one empty hole. In the above example, this gives us two options:

```
     BOARD A                        BOARD B
     -> o                             o <-
   -> •   •                         •   • <-
 -> •   •   •                     •   •   • <-
  •   •   •   •                 •   •   •   •
•   •   •   •   •             •   •   •   •   •
```

You eliminate a peg by jumping over it, so in either example, the peg on the third row jumps over the peg in the second row and lands in the hole on the first row. This would leave two holes open, the one vacated by the peg on the third row, and the removed peg from the second hole. Here is how that move would play out in either of the above scenarios.

```
     BOARD A                        BOARD B
        •                             •
      o   •                         •   o
    o   •   •                     •   •   o
  •   •   •   •                 •   •   •   •
•   •   •   •   •             •   •   •   •   •
```

Play continues as above until there are no more moves that can be made. This will happen when all of the pegs are separated by at least one empty space (example 1), or if pegs are adjacent but there is no adjacent empty hole (example 2).

```
    EXAMPLE 1                     EXAMPLE 2
        •                             o
      o   o                         o   o
    o   o   •                     •   o   o
  o   •   o   o                 o   •   o   o
o   o   o   o   o             o   o   •   o   o
```

You want to try to remove as many pegs as possible. It is possible to end the game with only one peg left! [Here is a quick :58 second video](https://www.youtube.com/watch?v=k60wDUHqPbY) of how to solve the Tricky Triangle while leaving only one peg remaining at the end.

## Setup

We have gotten you started with a printable board string that will look like the output below. Feel free to use this to get started, or write your own board printer!

```
             1
A          o   2
B        •   •   3
C      •   •   •   4
D    •   •   •   •   5
E  •   •   •   •   •
```

The given board considers each position an ruby object on a board object. There are many other ways to print out the board, but an important consideration is how to select the pieces. You could letter or number each space, but you have to be able to determine which spaces are occupied and which are open.

## Stretch

So you finished your triangle? Try these additional challenges:

### Peg solitare
Triangles are not the only tricky shapes. Try this challenge with [other board shapes](https://en.wikipedia.org/wiki/Peg_solitaire#Board).

### Time limit
There should be a time limit of 60 seconds.

### Board solver
Can you build a solver? Given any empty starting position, can you list what moves will yield the fewest pegs at the end?
