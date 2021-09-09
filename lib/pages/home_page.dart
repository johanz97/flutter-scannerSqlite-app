import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner_sqlite/pages/direcciones_page.dart';
import 'package:scanner_sqlite/pages/mapas_page.dart';
import 'package:scanner_sqlite/providers/db_provider.dart';
import 'package:scanner_sqlite/providers/ui_providers.dart';
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
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
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
    //final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.deleteallScan().then((value) => print(value));

    final uiProvider = Provider.of<UIProviders>(context);
    final currentIndex = uiProvider.selectedOpt;
    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
