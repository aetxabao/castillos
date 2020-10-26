import 'dart:convert';

import 'package:castillos/models/patrimonio_model.dart';
import 'package:castillos/models/puntos_model.dart';
import 'package:flutter/services.dart';

class PuntosProvider {
  List<Patrimonio> _listaPatrimonios = [];
  List<Patrimonio> _listaCastillosPalacios = [];

  Future<List<Patrimonio>> cargarPuntos() async {
    final data = await rootBundle
        .loadString('assets/data/Opendata_Resultados_PM_es.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Puntos puntos = Puntos.fromJsonList(openDataRow);
    _listaPatrimonios = puntos.lista;
    return _listaPatrimonios;
  }

  Future<List<Patrimonio>> getListaCastillosPalacios() async {
    if (_listaCastillosPalacios.length == 0) {
      if (_listaPatrimonios.length == 0) {
        await cargarPuntos();
      }
      _listaCastillosPalacios = [];
      _listaPatrimonios.forEach((p) {
        if (p.tipo == "Castillos/Palacios") {
          _listaCastillosPalacios.add(p);
        }
      });
    }
    return _listaCastillosPalacios;
  }
}

final puntosProvider = new PuntosProvider();
