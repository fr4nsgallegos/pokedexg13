import 'package:flutter/material.dart';
import 'package:pokemonappg13/provider/pages/provider_page_2.dart';
import 'package:pokemonappg13/provider/perrito_provider.dart';
import 'package:pokemonappg13/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProviderPage2 extends StatelessWidget {
  ProviderPage2({super.key});
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final perritoProvider = Provider.of<PerritoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("PROVIDER PAGE")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Perrito: ${perritoProvider.name}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35),
              ),
              ElevatedButton(
                onPressed: () {
                  perritoProvider.name = "LUCAS";
                },
                child: Text("Cambiar nombre del perrito"),
              ),
              Divider(),
              Text(
                "Usuario: ${userProvider.name}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35),
              ),
              ElevatedButton(
                onPressed: () {
                  userProvider.name = "JHONNY";
                },
                child: Text("Cambiar nombre del usuario"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
