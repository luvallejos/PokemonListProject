*** Settings ***
Library     SeleniumLibrary

Resource  baseresources.robot

#### This resource has all the elements and methods for pokemon home page ####

*** Variables ***
# Sidebar section
${pokedex_sidebar_btn}  class:explore
${videogames_sidebar_btn}   class:watch
${cardgame_sidebar_btn}     class:play
${pokemonTV_sidebar_btn}    class:attend
${pokemon_events_sidebar_btn}    class:trade
${news_sidebar_btn}     class:game.last-item


*** Keywords ***
# This method goes to Pokedex page
Go to Pokedex page
    Log to console  Running Step:: Go to Pokedex page
    Click Element  ${pokedex_sidebar_btn}
    Wait until Page Contains Element    ${pokedex_title}
