import requests
import json


class HandlingPokemonData:

    """This class handles the data related to the pokemons list obtained from the requests"""

    # This method obtains the first list of 30 pokemons and return a dictionary with name and url for each one
    def get_pokemons_url_list(self, request_url):
        pokemon_list = dict()
        response = json.loads(requests.get(request_url).text)

        for item in response["results"]:
            pokemon_list[item["name"]] = item["url"]
        return pokemon_list

    # This method obtains the list of pokemons for a specific type
    def get_pokemons_type_list(self, pokemon_list, type):

        pokemon_normal = []

        for key, value in pokemon_list.items():
            response = json.loads(requests.get(value).text)

            for item in response["types"]:
                if item["type"]["name"] == type:
                    pokemon_normal.append(key)

        print("Pokemons with %s Type: %s" % (type, pokemon_normal))
        return pokemon_normal
