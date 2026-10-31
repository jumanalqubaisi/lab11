
:- dynamic letters/1.

letters([a,b,c,d]).

start :-
    writeln('Hi. This is the Name Game.'),
    writeln('You will be given a set of English letters'),
    writeln('in which you will add, delete or move to create your name.'),
    menu.

menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    write('Enter your choice: '),
    read(Choice),
    action(Choice).

action(1) :-
    letters(L),
    writeln(L),
    menu.

action(2) :-
    write('Enter a letter: '),
    read(X),
    letters(L),
    append(L, [X], New),
    retractall(letters(_)),
    assertz(letters(New)),
    menu.

action(3) :-
    write('Enter a letter: '),
    read(X),
    letters(L),
    New = [X|L],
    retractall(letters(_)),
    assertz(letters(New)),
    menu.

action(4) :-
    write('Enter a letter: '),
    read(X),
    letters(L),
    append(L, [X], New),
    retractall(letters(_)),
    assertz(letters(New)),
    menu.

action(5) :-
    write('Enter a letter to delete: '),
    read(X),
    letters(L),
    ( select(X, L, New) ->
        retractall(letters(_)),
        assertz(letters(New)),
        writeln('Letter deleted')
    ;
        writeln('Letter not found')
    ),
    menu.

action(6) :-
    retractall(letters(_)),
    assertz(letters([])),
    writeln('All letters deleted'),
    menu.

action(7) :-
    writeln('Goodbye!').

action(_) :-
    writeln('Invalid choice'),
    menu.
