import 'package:flutter/material.dart';
import 'package:pokemonappg13/models/pokemon_reponse.dart';

class PokemonWidget extends StatelessWidget {
  Pokemon pokemon;
  PokemonWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pokemon.name),
              Icon(Icons.favorite_border_outlined),
            ],
          ),
          Image.network(pokemon.img),
        ],
      ),
    );
  }
}
