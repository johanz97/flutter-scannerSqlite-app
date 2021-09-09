import 'package:flutter/material.dart';

class UIProviders extends ChangeNotifier {
  int _selectedMenuOpt = 0;
  int get selectedOpt {
    return this._selectedMenuOpt;
  }

  set selectedOpt(int index) {
    this._selectedMenuOpt = index;
    notifyListeners();
  }
}
