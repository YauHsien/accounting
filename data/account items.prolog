file_path('account items.csv').

data(Input) :-
    file_path(Path),
    csv_read_file(Path, Raw, [convert(false)]),
    data_(Raw, Input).

data_([], []).
data_([row(Index,Chn,Eng,D1,D2)|Raw], Result) :-
    ( split_(Index, '-\n', Indices)
    ; split_(Index, '-', Indices)
    ),
    [_] \= Indices, !,
    findall(
        row(I,Chn,Eng,D1,D2),
        member(I, Indices),
        Terms
    ),
    data_(Raw, R1),
    append(Terms, R1, Result).
data_([row(Index,Chn,Eng,D1,D2)|Raw], [row(Index,Chn,Eng,D1,D2)|Result]) :-
    data_(Raw, Result).

split_(Index, Sep, [A|Indices]) :-
    atom_concat(A, B, Index),
    atom_prefix(B, Sep), !,
    atom_concat(Sep, C, B),
    split_(C, Sep, Indices).
split_(Index, _, [Index]).

sql(_, [], []).
sql(Format, [row(A,B,C,D,E)|Input], [Sql_string|Sql_strings]) :-
    format(string(Sql_string), Format, [A,B,C,D,E]),
    sql(Format, Input, Sql_strings).

sql_format("insert into account_items (id, name, name_en, desc, desc_en) values (~p, ~p, ~p, ~p, ~p)").

convert(Sql_strings) :-
    data(Input),
    sql_format(Format),
    sql(Format, Input, Sql_strings).

convert :-
    convert(Sql_strings),
    forall(
        member(Sql_string, Sql_strings),
        format("~w~n", [Sql_string])
    ).
