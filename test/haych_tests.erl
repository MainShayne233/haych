-module(haych_tests).

-include_lib("eunit/include/eunit.hrl").

hello_test() ->
  Expected = <<"Hello">>,
    Actual = haych:hello(),
    Expected = Actual.
