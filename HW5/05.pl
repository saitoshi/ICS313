/*
@assignment ICS 313 Homework 5
@description A prolog 4x4 sudoku solver in which solves a 4x4 sudoku
@author Saito, Shin
*/
/** Function call that solves the sudoku**/
sudoku4x4(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4) :- sudoku(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4),
	printsudoku(A1, A2, A3, A4),
	printsudoku(B1, B2, B3, B4),
	printsudoku(C1, C2, C3, C4),
	printsudoku(D1, D2, D3, D4).

/** The functioon that calls out the **/
printsudoku(A, B, C, D) :- write(' '), write(A), write('  '), write(B), write('  '), write(C), write('  '), write(D), nl.

/** The function that calculates the sudoku puzzle **/
sudoku(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4) :-
    /** set the format of the rows **/
    Row1 = [A1, A2, A3, A4],
    Row2 = [B1, B2, B3, B4],
    Row3 = [C1, C2, C3, C4],
    Row4 = [D1, D2, D3, D4],

/** set the format of the columns **/
    Col1 = [A1, B1, C1, D1],
    Col2 = [A2, B2, C2, D2],
    Col3 = [A3, B3, C3, D3],
    Col4 = [A4, B4, C4, D4],

/** set the format of the squares  **/
    Square1 = [A1, A2, B1, B2],
    Square2 = [A3, A4, B3, B4],
    Square3 = [C1, C2, D1, D2],
    Square4 = [C3, C4, D3, D4],

    Sets = [Row1, Row2, Row3, Row4,
           Col1, Col2, Col3, Col4,
           Square1, Square2, Square3, Square4],
    /**read permuation from https://www.swi-prolog.org/pldoc/man?predicate=permutation/2**/
    /** From Math 475: Intro to Combinatorics we know that permutation is a particular ordering of symbols
    which is similar to sudoku as we order numbers from a range of n from n x n **/
    maplist(permutation([1,2,3,4]), Sets).
