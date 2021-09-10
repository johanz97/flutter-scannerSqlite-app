import 'package:flutter/material.dart';
import 'package:scanner_sqlite/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';
  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //signar id de la db al modelo
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosScan();
    this.scans = [...scans!];
    notifyListeners();
  }

  cargarScansTipo(String tipo) async {
    final scans = await DBProvider.db.getScansTipo(tipo);
    this.scans = [...scans!];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteallScan();
    this.scans = [];
    notifyListeners();
  }

  borrarScansId(int id) async {
    await DBProvider.db.getScanById(id);
    this.scans = await cargarScansTipo(this.tipoSeleccionado);
  }
}
