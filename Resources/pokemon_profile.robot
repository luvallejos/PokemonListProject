*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     String

Resource  baseresources.robot

#### This resource has all the elements and methods for pokemon profile page ####

*** Variables ***
# Title section
${pokemon_title_profile}  xpath://div[@class='pokedex-pokemon-pagination-title']//div[contains(text(),'POKEMON_NAME')]

# Characteristics section
${characteristics_table}  xpath://div[@class='info match-height-tablet']
# xpath for Height, Weight and Category
${pokemon_characteristic}  xpath://li//span[@class='attribute-title' and text()='CHARACTERISTIC_NAME']//following-sibling::span[@class='attribute-value' and contains(text(),\"CHARACTERISTIC_VALUE\")]
# xpath for Abilites
${pokemon_abilities}    xpath://li//span[@class='attribute-title' and text()='Abilities']//parent::li//span[text()='ABILITIE_NAME']
# xpaths for Gender
${female_gender}   xpath://li//span[@class='attribute-title' and text()='Gender']//following-sibling::span[@class='attribute-value']//i[@class='icon icon_female_symbol']
${male_gender}   xpath://li//span[@class='attribute-title' and text()='Gender']//following-sibling::span[@class='attribute-value']//i[@class='icon icon_male_symbol']
${hermaphrodite_gender}   xpath:(//li//span[@class='attribute-title' and text()='Gender']//following-sibling::span[@class='attribute-value']//i)[2]
${unkown_gender}    xpath://li//span[@class='attribute-title' and text()='Gender']//following-sibling::span[@class='attribute-value' and contains(text(),'Unknown')]

# Type section
${type_section_title}     xpath://div[@class='dtm-type']/h3
${type_list}     xpath:(//div[@class='dtm-type'])[1]//ul//a

# Weaknesses section
${weaknesses_section_title}  xpath://div[@class='dtm-weaknesses']//h3
${weaknesses_list}   xpath:(//div[@class='dtm-weaknesses'])[1]//li//span
${evolution_section}    xpath://section[contains(@class,'section pokedex-pokemon-evolution')]



*** Keywords ***
# This method verifies a characteristic of a pokemon by name and value
Verify a characteristic of the pokemon
    [Arguments]     ${characteristic}   ${value}
    Log to console  Running Step:: Verify a characteristic of the pokemon - ${characteristic}: ${value}
    Scroll Element Into View    ${characteristics_table}
    Sleep  3
    ${ele}=    Replace String  ${pokemon_characteristic}    CHARACTERISTIC_NAME    ${characteristic}
    ${item}=    Replace String  ${ele}    CHARACTERISTIC_VALUE    ${value}
    Element Should Be Visible    ${item}


# This method verifies the ability of a pokemon
Verify the ability of the pokemon
    [Arguments]     ${abilitie_value}
    Log to console  Running Step:: Verify ability of the pokemon - Ability: ${abilitie_value}
    Scroll Element Into View    ${characteristics_table}
    Sleep  3
    ${elem}=    Replace String  ${pokemon_abilities}    ABILITIE_NAME    ${abilitie_value}
    Element Should Be Visible    ${elem}


# This method verifies the gender of a pokemon - Use inputs: Female, Male, Hermaphrodite, Unknown
Verify the gender of the pokemon
    [Arguments]     ${gender}
    Log to console  Running Step:: Verify the gender of the pokemon - Gender: ${gender}
    Scroll Element Into View    ${characteristics_table}
    Sleep  3
    Run Keyword If  '${gender}' == 'Female'   Check Female gender
    Run Keyword If  '${gender}' == 'Male'   Check Male gender
    Run Keyword If  '${gender}' == 'Hermaphrodite'  Element Should Be Visible    ${hermaphrodite_gender}   msg=Pokemon gender doesn't match
    Run Keyword If  '${gender}' == 'Unknown'  Element Should Be Visible    ${unkown_gender}   msg=Pokemon gender doesn't match


# This method verifies the Female gender for a pokemon
Check Female gender
    Element Should Be Visible    ${female_gender}   msg=Pokemon gender doesn't match
    Element Should Not Be Visible    ${hermaphrodite_gender}    msg=Pokemon gender doesn't match

# This method verifies the Male gender for a pokemon
Check Male gender
    Element Should Be Visible    ${male_gender}  msg=Pokemon gender doesn't match
    Element Should Not Be Visible    ${hermaphrodite_gender}   msg=Pokemon gender doesn't match


# This method get the list of Types
Obtain the list of types for the pokemon
    Log to console  Running Step:: Obtain the list of types for the pokemon
    Scroll Element Into View    ${type_section_title}
    Sleep   3
    ${type_elements_list}=  Get WebElements   ${type_list}
    ${list}=  Create List
    FOR   ${elem}  IN   @{type_elements_list}
        Append To List    ${list}   ${elem.text}
    END
    Set Suite Variable	${pokemon_types_list}   ${list}

# This method get the list of weaknesses
Obtain the list of weaknesses for the pokemon
    Log to console  Running Step:: Obtain the pokemon weaknesses
    Scroll Element Into View    ${weaknesses_section_title}
    Sleep   3
    ${weanesses_element_list}=  Get WebElements   ${weaknesses_list}
    ${list}=  Create List
    FOR   ${elem}  IN   @{weanesses_element_list}
        Append To List    ${list}   ${elem.text}
    END
    Set Suite Variable  ${pokemon_weaknesses_list}  ${list}


# This method verifies the weaknesses list of a pokemon
Verify the weaknesses list of the pokemon
    [Arguments]     @{weaknesses}
    Log to console  Running Step:: Verify the weaknesses list of the pokemon
    Obtain the list of weaknesses for the pokemon
    ${L2}=   Create List   @{weaknesses}
    Lists Should Be Equal  ${pokemon_weaknesses_list}  ${L2}  msg=Weaknesses list doesn't match with expected weaknesses  ignore_order=True


# This method verifies the types list of a pokemon
Verify the types list of the pokemon
    [Arguments]     @{types}
    Log to console  Running Step:: Verify the types list of the pokemon
    Obtain the list of types for the pokemon
    ${L2}=   Create List   @{types}
    Lists Should Be Equal  ${pokemon_types_list}  ${L2}  msg=Types list doesn't match with expected types  ignore_order=True