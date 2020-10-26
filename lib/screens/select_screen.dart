import 'package:castillos/models/patrimonio_model.dart';
import 'package:castillos/providers/puntos_provider.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Castillos y palacios de Navarra"),
        ),
        body: _lista());
  }

  Widget _lista() {
    return FutureBuilder(
      future: puntosProvider.getListaCastillosPalacios(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(children: _listaElementos(snapshot.data));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<Widget> _listaElementos(List<Patrimonio> data) {
    final List<Widget> lst = [];
    data.forEach((p) {
      final w = ListTile(
        title: Text(p.nombre),
        onTap: () {
          print(p.nombre);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
