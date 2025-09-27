import 'package:flutter/material.dart';
import 'package:pokemonappg13/widgets/pokemon_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tu Pokedex",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "¿Quién es ese pokemón? Busca el pokemon de tu preferencia y observa sus cualidades",
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.97,
                  ),
                  children: [
                    PokemonWidget(),
                    PokemonWidget(),
                    PokemonWidget(),
                    PokemonWidget(),
                    PokemonWidget(),
                    PokemonWidget(),
                    PokemonWidget(),
                    PokemonWidget(),
                    PokemonWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
