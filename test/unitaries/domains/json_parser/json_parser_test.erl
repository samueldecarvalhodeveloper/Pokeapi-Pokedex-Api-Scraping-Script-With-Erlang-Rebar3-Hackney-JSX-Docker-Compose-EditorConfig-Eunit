-module(json_parser_test).

-include_lib("eunit/include/eunit.hrl").

-include("src/constants/domains/pokemon_constants.hrl").
-include("src/constants/domains/json_parser_constants.hrl").

function_get_parsed_json_returning_parsed_json_from_string_test() ->
    PokemonUrl = string:concat(?POKEMON_DATA_URL, ?BULBASAUR_ID),

    NotParsedJsonOfPokemonData = http_client:get_request_response_body(PokemonUrl),

    ParsedJson = json_parser:get_parsed_json(NotParsedJsonOfPokemonData),

    ?assertEqual(?BULBASAUR_ID, lists:flatten(io_lib:format("~p",[maps:get(?POKEMON_DATA_MAP_ID_KEY, ParsedJson)]))),
    ?assertEqual(?BULBASAUR_NAME, binary_to_list(maps:get(?POKEMON_DATA_MAP_NAME_KEY, ParsedJson))).

function_get_serialized_json_returning_serialized_binary_string_of_json_test() ->
    SerializedJson = json_parser:get_serialized_json(?DESERIALIZED_JSON),

    ?assertEqual(?SERIALIZED_JSON, SerializedJson).
