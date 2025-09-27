import 'package:flutter/material.dart';
import 'package:pokemonappg13/provider/counter_provider.dart';
import 'package:provider/provider.dart';
// PRIMERA FORMA
// class ProviderCounterPage extends StatelessWidget {
//   const ProviderCounterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print("Reconstruyendo el build");
//     return Scaffold(
//       appBar: AppBar(title: Text("Contador con provider")),
//       body: Center(
//         child: Consumer<CounterProvider>(
//           builder: (context, value, child) => Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("Valor: ${value.count}", style: TextStyle(fontSize: 50)),
//               ElevatedButton(
//                 onPressed: () {
//                   context.read<CounterProvider>().increment();
//                 },
//                 child: Text("Incrementar"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   context.read<CounterProvider>().decrement();
//                 },
//                 child: Text("Restar"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// SEGUNDA FORMA
class ProviderCounterPage extends StatelessWidget {
  const ProviderCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    print("Reconstruyendo el build");
    return Scaffold(
      appBar: AppBar(title: Text("Contador con provider")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Valor: ${counter.count}", style: TextStyle(fontSize: 50)),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: Text("Incrementar"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().decrement();
              },
              child: Text("Restar"),
            ),
          ],
        ),
      ),
    );
  }
}
