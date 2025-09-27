import 'package:flutter/material.dart';
import 'package:pokemonappg13/pages/articles_page.dart';
import 'package:pokemonappg13/pages/home_page.dart';
import 'package:pokemonappg13/provider/counter_provider.dart';
import 'package:pokemonappg13/provider/pages/provider_counter_page.dart';
import 'package:pokemonappg13/provider/pages/provider_page.dart';
import 'package:pokemonappg13/provider/perrito_provider.dart';
import 'package:pokemonappg13/provider/user_provider.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     MaterialApp(home: ProviderCounterPage(), debugShowCheckedModeBanner: false),
//   );
// }

// USO DE PROVIDER CUANDO SOLO TENEMOS 1
// void main() {
//   runApp(
//     // El provider se pone en lo más alto posible del árbol
//     ChangeNotifierProvider(
//       create: (_) => CounterProvider(),
//       child: MaterialApp(
//         home: ProviderCounterPage(),
//         debugShowCheckedModeBanner: false,
//       ),
//     ),
//   );
// }

// USO DE PROVIDER CUANDO TENEMOS MÁS DE 1
void main() {
  runApp(
    // El provider se pone en lo más alto posible del árbol
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PerritoProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: MaterialApp(
        home: ProviderPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
