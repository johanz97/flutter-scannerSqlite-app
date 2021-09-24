import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner_sqlite/pages/home_page.dart';
import 'package:scanner_sqlite/pages/mapa_page.dart';
import 'package:scanner_sqlite/providers/scan_list_provider.dart';
import 'package:scanner_sqlite/providers/ui_providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UIProviders()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lector QR',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepPurple),
            appBarTheme: AppBarTheme(color: Colors.deepPurple)),
      ),
    );
  }
}
