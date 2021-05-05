*** Settings ***
Documentation    This Suite validate the weaknesses for pokemons by name of pokemon

#Command to run this suite:
#robot -d results -b debug --loglevel DEBUG --include pokemon_weaknesses Testsuites/

Resource  ../Resources/baseresources.robot


*** Variables ***

#### Expected weaknesses by pokemon ####

@{pidgey_weaknesses}    Electric    Ice     Rock
@{pidgeotto_weaknesses}  Electric    Ice     Rock
@{bulbasaur_weaknesses}     Fire    Psychic     Flying   Ice


*** Test Cases ***
Verify the list of weaknesses for Pidgey pokemon
    [Documentation]  Test Case: Verify the list of weaknesses for Pidgey pokemon
    [Tags]  pokemon_weaknesses

    Log to console  Running Test Case:: Verify the list of weaknesses for Pidgey pokemon
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Pidgey
    pokemon_profile.Verify the weaknesses list of the pokemon   @{pidgey_weaknesses}
    common.End Web Test


Verify the list of weaknesses for Pidgeotto pokemon
    [Documentation]  Test Case: Verify the list of weaknesses for Pidgeotto pokemon
    [Tags]  pokemon_weaknesses

    Log to console  Running Test Case:: Verify the list of weaknesses for Pidgeotto pokemon
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Pidgeotto
    pokemon_profile.Verify the weaknesses list of the pokemon   @{pidgeotto_weaknesses}
    common.End Web Test


Verify the list of weaknesses for Bulbasaur pokemon
    [Documentation]  Test Case: Verify the list of weaknesses for Bulbasaur pokemon
    [Tags]  pokemon_weaknesses

    Log to console  Running Test Case:: Verify the list of weaknesses for Bulbasaur pokemon
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Bulbasaur
    pokemon_profile.Verify the weaknesses list of the pokemon   @{bulbasaur_weaknesses}
    common.End Web Test