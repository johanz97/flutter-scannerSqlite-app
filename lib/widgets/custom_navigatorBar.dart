import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner_sqlite/providers/ui_providers.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProviders>(context);
    final currentIndex = uiProvider.selectedOpt;
    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedOpt = i,
        currentIndex: currentIndex,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
        ]);
  }
}
