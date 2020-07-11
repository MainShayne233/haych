-module(haych_tests).

-include_lib("eunit/include/eunit.hrl").

parse_doctype_declaration_test() ->
    SimpleInput = <<"<!DOCTYPE html>">>,
    SwitchedCaseInput = <<"<!doctype HTML>">>,
    DTDInput = <<"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">">>,
    NoneInput = <<"<h1>hi</h1>">>,
    {ok, {doctype, <<"html">>, <<"">>}} =
      haych:parse_doctype_declaration(SimpleInput),
    {ok, {doctype, <<"html">>, <<"">>}} =
      haych:parse_doctype_declaration(SwitchedCaseInput),
    {ok, {doctype, <<"html">>,
       <<"PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"">>}} =
     haych:parse_doctype_declaration(DTDInput),
    {error, nomatch} = haych:parse_doctype_declaration(NoneInput).
