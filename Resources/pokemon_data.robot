*** Settings ***
Library     SeleniumLibrary
Library  ../CustomKeywords/HandlingPokemonData.py

Resource  baseresources.robot

#### This resource has all the methods to handle api requests and result data ####


*** Keywords ***

# This method obtains a list of pokemons from a request to an endpoint and filtering by a type
Obtain pokemons list from request url and filter by type
    [Arguments]     ${pokemon_type}  ${request_api_url}
    Log to console  Running Step:: Obtain pokemons list from request url and filter by type - Type: ${pokemon_type}
    ${pokemons_urls}    Get Pokemons Url List    ${request_api_url}
    ${pokemons_list_by_type}    Get Pokemons Type List  ${pokemons_urls}   ${pokemon_type}
    Set Suite Variable	${pokemons_list_by_type}	${pokemons_list_by_type}


