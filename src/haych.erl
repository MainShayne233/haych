-module(haych).

-export([parse_doctype_declaration/1]).


parse_doctype_declaration(Input) ->
    {ok, RegEx} = re:compile("^<!doctype +([A-Za-z]*)(.*)>", [caseless]),
    case re:run(Input, RegEx, [{capture, all, binary}]) of
      {match, [_, Type, Meta]} ->
            {ok, {doctype, string:lowercase(Type), string:trim(Meta)}};
       nomatch ->
            {error, nomatch}
    end.

