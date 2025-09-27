import 'package:flutter/material.dart';

class PerritoProvider extends ChangeNotifier {
  String _name = "Perrito sin Nombre";

  String get name => _name;

  set name(String newNmae) {
    _name = newNmae;
    notifyListeners();
  }
}
