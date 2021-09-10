import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner_sqlite/providers/scan_list_provider.dart';
import 'package:scanner_sqlite/providers/ui_providers.dart';
import 'package:scanner_sqlite/widgets/scan_list.dart';
import 'package:scanner_sqlite/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historial',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProviders>(context);
    final currentIndex = uiProvider.selectedOpt;
    //Usar Scanlistproviders
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansTipo('geo');
        return ScanList(tipo: 'geo');
      case 1:
        scanListProvider.cargarScansTipo('http');
        return ScanList(tipo: 'http');
      default:
        return ScanList(tipo: 'geo');
    }
  }
}
