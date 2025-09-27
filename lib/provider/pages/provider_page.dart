import 'package:flutter/material.dart';
import 'package:pokemonappg13/provider/pages/provider_page_2.dart';
import 'package:pokemonappg13/provider/perrito_provider.dart';
import 'package:pokemonappg13/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  ProviderPage({super.key});
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("PROVIDER PAGE")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<PerritoProvider>(
                builder: (context, perrito, child) => Text(
                  "Perrito: ${perrito.name}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Divider(),
              Text(
                "Usuario: ${userProvider.name}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProviderPage2()),
                  );
                },
                child: Text("Ir a la siguiente pantalla"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
