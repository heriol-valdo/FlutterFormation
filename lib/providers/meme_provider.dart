import 'package:flutter/material.dart';
import 'package:formation/models/meme.dart';

class MemeProvider extends ChangeNotifier {
  // propriété
  Meme? _meme;

  // getters / setters
  Meme? get meme => _meme;
  set meme(Meme? value) {
    _meme = value;
    // notifyListeners : déclencher la mise à jour des données dans les écouteurs
    notifyListeners();
  }
}
