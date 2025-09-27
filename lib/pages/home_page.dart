import 'package:flutter/material.dart';
import 'package:pokemonappg13/models/pokemon_reponse.dart';
import 'package:pokemonappg13/services/pokemon_api.dart';
import 'package:pokemonappg13/widgets/pokemon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonResponse? _pokemonResponse;

  Future<void> fetchPokemonResponse() async {
    _pokemonResponse = await PokemonApi().getPokemonResponse();
    print(_pokemonResponse);
    setState(() {});
  }

  @override
  void initState() {
    fetchPokemonResponse();
    super.initState();
  }

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
                  children: _pokemonResponse!.pokemon
                      .map((pokemon) => PokemonWidget(pokemon: pokemon))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
