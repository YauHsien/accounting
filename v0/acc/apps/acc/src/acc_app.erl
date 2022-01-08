%%%-------------------------------------------------------------------
%% @doc acc public API
%% @end
%%%-------------------------------------------------------------------

-module(acc_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    acc_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
