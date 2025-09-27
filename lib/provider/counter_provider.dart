import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++; //cambiamos el estado
    notifyListeners(); //notificadmos a los widgets que escuchan
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
