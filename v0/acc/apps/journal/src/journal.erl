-module(journal).

-export([entry/0]).

entry() ->
    io:fwrite("hello,world from ~p~n", [journal]).
