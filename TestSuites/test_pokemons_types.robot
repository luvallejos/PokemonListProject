*** Settings ***
Documentation    This Suite validate the types for pokemons by name of pokemon

#Command to run this suite:
#robot -d results -b debug --loglevel DEBUG --include pokemon_types Testsuites/

Resource  ../Resources/baseresources.robot


*** Variables ***

#### Expected Types by pokemon ####

@{charmander_types}    Fire
@{caterpie_types}    Bug
@{buterfree_types}    Bug   Flying


*** Test Cases ***
Verify the list of types for Charmander pokemon
    [Documentation]  Test Case: Verify the list of types for Charmander pokemon
    [Tags]  pokemon_types

    Log to console  Running Test Case:: Verify the list of weaknesses for Charmander pokemon
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Charmander
    pokemon_profile.Verify the types list of the pokemon   @{charmander_types}
    common.End Web Test


Verify the list of types for Caterpie pokemon
    [Documentation]  Test Case: Verify the list of types for Caterpie pokemon
    [Tags]  pokemon_types

    Log to console  Running Test Case:: Verify the list of weaknesses for Caterpie pokemon
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Caterpie
    pokemon_profile.Verify the types list of the pokemon   @{caterpie_types}
    common.End Web Test


Verify the list of types for Butterfree pokemon
    [Documentation]  Test Case: Verify the list of types for Butterfree pokemon
    [Tags]  pokemon_types

    Log to console  Running Test Case:: Verify the list of weaknesses for Butterfree pokemon
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Butterfree
    pokemon_profile.Verify the types list of the pokemon   @{buterfree_types}
    common.End Web Test