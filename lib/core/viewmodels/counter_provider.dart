import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _number = 0;
  int get number => _number;

  void addNumber(int value) {
    _number += value;;
    notifyListeners();
  }

  void removeNumber(int value) {
    if (_number - value >= 0) 
      _number -= value;
      notifyListeners();
  }
}