*** Settings ***
Documentation    This Suite validates the characteristics of pokemons like Height, Weight, Category, Abilities and Gender

Resource  ../Resources/baseresources.robot

#Command to run this suite:
#robot -d results -b debug --loglevel DEBUG --include pokemon_description Testsuites/



*** Test Cases ***
Verify the characteristics for pokemon Chikorita
    [Documentation]  Test Case Verify the characteristics for pokemon Chikorita
    [Tags]  pokemon_description

    Log to console  Running Test Case:: Verify the characteristics for pokemon Chikorita
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Chikorita
    pokemon_profile.Verify a characteristic of the pokemon  Height    2' 11
    pokemon_profile.Verify a characteristic of the pokemon  Weight    14.1 lbs
    pokemon_profile.Verify a characteristic of the pokemon  Category    Leaf
    pokemon_profile.Verify the ability of the pokemon   Overgrow
    pokemon_profile.Verify the gender of the pokemon    Hermaphrodite
    common.End Web Test


Verify the characteristics for pokemon Nidorina
    [Documentation]  Test Case Verify the characteristics for pokemon Nidorina
    [Tags]  pokemon_description

    Log to console  Running Test Case:: Verify the characteristics for pokemon Nidorina
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Nidorina
    pokemon_profile.Verify a characteristic of the pokemon  Height    2' 07
    pokemon_profile.Verify a characteristic of the pokemon  Weight    44.1 lbs
    pokemon_profile.Verify a characteristic of the pokemon  Category    Poison Pin
    pokemon_profile.Verify the ability of the pokemon   Poison Point
    pokemon_profile.Verify the ability of the pokemon   Rivalry
    pokemon_profile.Verify the gender of the pokemon    Female
    common.End Web Test


Verify the characteristics for pokemon Hitmonlee
    [Documentation]  Test Case Verify the characteristics for pokemon Hitmonlee
    [Tags]  pokemon_description

    Log to console  Running Test Case:: Verify the characteristics for pokemon Hitmonlee
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Hitmonlee
    pokemon_profile.Verify a characteristic of the pokemon  Height    4' 11
    pokemon_profile.Verify a characteristic of the pokemon  Weight    109.8 lbs
    pokemon_profile.Verify a characteristic of the pokemon  Category    Kicking
    pokemon_profile.Verify the ability of the pokemon   Limber
    pokemon_profile.Verify the ability of the pokemon   Reckless
    pokemon_profile.Verify the gender of the pokemon    Male
    common.End Web Test


Verify the characteristics for pokemon Magnemite
    [Documentation]  Test Case Verify the characteristics for pokemon Magnemite
    [Tags]  pokemon_description

    Log to console  Running Test Case:: Verify the characteristics for pokemon Magnemite
    common.Begin Web Test
    pokemon_home.Go to Pokedex page
    pokedex.Search and select specific pokemon to go to pokemon profile     Magnemite
    pokemon_profile.Verify a characteristic of the pokemon  Height    1' 00
    pokemon_profile.Verify a characteristic of the pokemon  Weight    13.2 lbs
    pokemon_profile.Verify a characteristic of the pokemon  Category    Magnet
    pokemon_profile.Verify the ability of the pokemon   Sturdy
    pokemon_profile.Verify the ability of the pokemon   Magnet Pull
    pokemon_profile.Verify the gender of the pokemon    Unknown
    common.End Web Test