import 'package:castillos/models/patrimonio_model.dart';

class Puntos {
  List<Patrimonio> lista = new List();
  Puntos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((json) {
      final pr = Patrimonio.fromJson(json);
      lista.add(pr);
    });
  }
}
