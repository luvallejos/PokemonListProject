*** Settings ***
Documentation    This Suite validate the weaknesses for each pokemon from a list of pokemon of a specific type

Resource  ../Resources/baseresources.robot

#Command to run this suite:
#robot -d results -b debug --loglevel DEBUG --include pokemon_weaknesses Testsuites/


*** Variables ***

#### Expected weaknesses for Pokemon Normal type ####

@{pidgey_weaknesses}    Electric    Ice     Rock
@{pidgeotto_weaknesses}  Electric    Ice     Rock
@{pidgeot_weaknesses}     Electric    Ice     Rock
@{rattata_weaknesses}   Fighting
@{raticate_weaknesses}  Fighting
@{spearow_weaknesses}    Electric    Ice     Rock
@{fearow_weaknesses}    Electric    Ice     Rock

&{dict_normal_pokemon_weaknesses}  Pidgey=@{pidgey_weaknesses}    Pidgeotto=@{pidgeotto_weaknesses}
...                             Pidgeot=@{pidgeot_weaknesses} Rattata=@{rattata_weaknesses}
...                             Raticate=@{raticate_weaknesses}     Spearow=@{spearow_weaknesses}
...                             Fearow=@{fearow_weaknesses}


#### Expected weaknesses for Pokemon Grass type ####

@{bulbasour_weaknesses}    Fire    Psychic     Flying   Ice
@{ivysaur_weaknesses}   Fire    Psychic     Flying   Ice
@{venusaur_weaknesses}     Fire    Psychic     Flying   Ice

&{dict_grass_pokemon_weaknesses}  Bulbasaur=@{bulbasour_weaknesses}    Ivysaur=@{ivysaur_weaknesses}
...                            Venusaur=@{venusaur_weaknesses}


*** Test Cases ***
Verify the list of weaknesses for each pokemon for a list of pokemons Normal type
    [Documentation]  Test Case Verify the list of weaknesses for each pokemon for a list of pokemons Normal type
    [Tags]  pokemon_list_type

    Log to console  Running Test Case:: Verify the list of weaknesses for each pokemon for a list of Normal pokemons
    pokemon_data.Obtain pokemons list from request url and filter by type   normal  https://pokeapi.co/api/v2/pokemon?limit=30
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Verify weaknessess for each pokemon in a list of pokemons  ${pokemons_list_by_type}  ${dict_normal_pokemon_weaknesses}
    common.End Web Test


Verify the list of weaknesses for each pokemon for a list of pokemons Grass type
    [Documentation]  Test Case Verify the list of weaknesses for each pokemon for a list of pokemons Grass type
    [Tags]  pokemon_list_type

    Log to console  Running Test Case:: Verify the list of weaknesses for Pidgey pokemon
    pokemon_data.Obtain pokemons list from request url and filter by type   grass  https://pokeapi.co/api/v2/pokemon?limit=30
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Verify weaknessess for each pokemon in a list of pokemons  ${pokemons_list_by_type}  ${dict_grass_pokemon_weaknesses}
    common.End Web Test