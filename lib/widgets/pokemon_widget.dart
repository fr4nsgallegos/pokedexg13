import 'package:flutter/material.dart';
import 'package:pokemonappg13/models/pokemon_reponse.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonWidget extends StatefulWidget {
  Pokemon pokemon;
  PokemonWidget({super.key, required this.pokemon});

  @override
  State<PokemonWidget> createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
  late Future<Color?> _dominantColor;

  Future<Color?> _getDominantColor(String urlImage) async {
    final imageProvider = NetworkImage(urlImage);
    final palleteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
    );
    return palleteGenerator.vibrantColor?.color;
  }

  @override
  void initState() {
    _dominantColor = _getDominantColor(widget.pokemon.img);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dominantColor,
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final Color dominanColor = asyncSnapshot.data ?? Colors.white;
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: dominanColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.pokemon.name),
                  Icon(Icons.favorite_border_outlined),
                ],
              ),
              Image.network(widget.pokemon.img),
            ],
          ),
        );
      },
    );
  }
}
