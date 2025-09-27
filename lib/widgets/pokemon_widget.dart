import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({super.key});

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
            children: [Text("Bulbasaur"), Icon(Icons.favorite_border_outlined)],
          ),
          Image.network("http://www.serebii.net/pokemongo/pokemon/001.png"),
        ],
      ),
    );
  }
}
