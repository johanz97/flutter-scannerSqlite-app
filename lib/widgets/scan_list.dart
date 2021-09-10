import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner_sqlite/providers/scan_list_provider.dart';

class ScanList extends StatelessWidget {
  final String tipo;

  const ScanList({Key? key, required this.tipo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direccion) {
                Provider.of<ScanListProvider>(context)
                    .borrarScansId(scans[i].id!);
              },
              child: ListTile(
                leading: Icon(
                  this.tipo == 'http' ? Icons.home_outlined : Icons.map,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[i].valor),
                subtitle: Text(scans[i].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => print(scans[i].id),
              ),
            ));
  }
}
