*** Settings ***
Library     SeleniumLibrary
Library     String

Resource  baseresources.robot

#### This resource has all the elements and methods for pokedex page ####

*** Variables ***
# Header section
${pokedex_title}  xpath://h1[text()='Pokédex']

# Search box section
${pokemon_search_input}  id:searchInput
${search_btn}   id:search

# Pokemon Results section
${pokemon_result}   xpath://ul[@class='results']//h5[text()='POKEMON_NAME']//ancestor::li/figure



*** Keywords ***
# This method searches a specific pokemon by name and goes to pokemon profile
Search and select specific pokemon to go to pokemon profile
    [Arguments]     ${pokemon_name}
    Log to console  Running Step:: Search and select specific pokemon - Pokemon Name: ${pokemon_name}
    Click Element   ${pokemon_search_input}
    Input Text  ${pokemon_search_input}  ${pokemon_name}
    Click Element  ${search_btn}
    ${pokemon}=    Replace String  ${pokemon_result}    POKEMON_NAME    ${pokemon_name}
    Wait until Page Contains Element    ${pokemon}   3 seconds
    Click Element   ${pokemon}
    ${pokemon_title}=    Replace String  ${pokemon_title_profile}    POKEMON_NAME    ${pokemon_name}
    Wait until Page Contains Element    ${pokemon_title}    3 seconds


########################################################################
########         Methods to manage list of pokemons            ########
########################################################################

# This method searches a list of pokemons and get a list of the weaknesses for each pokemon
Search a list of pokemons and obtain their weaknesses
    [Arguments]    ${pokemons_list}
    Log to console  Running Step:: Search a list of pokemons and obtain their weaknesses
    &{dict}=    Create Dictionary
    FOR    ${item}   IN    @{pokemons_list}
        ${pokemon}=    Convert To Title Case    ${item}
        Search and select specific pokemon to go to pokemon profile     ${pokemon}
        pokemon_profile.Obtain the list of weaknesses for the pokemon
        Set To Dictionary   ${dict}   ${pokemon}   ${pokemon_weaknesses_list}
        pokemon_home.Go to Pokedex page
    END
    Set Suite Variable  ${weaknesses_by_pokemons}  &{dict}


# This method validates the list of weaknesses for each pokemon using a list of pokemons
Verify weaknessess for each pokemon in a list of pokemons
    [Arguments]    ${pokemons_list}     ${weaknesses_bypokemon_expected}
    Log to console  Running Step:: Verify weaknessess for each pokemon in a list of pokemons
    Search a list of pokemons and obtain their weaknesses   ${pokemons_list}
    Dictionaries Should Be Equal    ${weaknesses_by_pokemons}   ${weaknesses_bypokemon_expected}  msg=Pokemon weaknesses list doesn't match with expected weaknesses


