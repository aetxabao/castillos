//import 'package:castillos/models/patrimonio_model.dart';
import 'package:castillos/providers/puntos_provider.dart';
import 'package:castillos/widgets/slider_widget.dart';
import 'package:castillos/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Castillos y palacios de Navarra"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              _swiper(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("Acceso al mapa")),
              SizedBox(
                height: 20.0,
              ),
              _slider(),
            ],
          ),
        ));
  }

  Widget _swiper() {
    return FutureBuilder(
      future: puntosProvider.getListaCastillosPalacios(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SwiperWidget(lista: snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _slider() {
    return FutureBuilder(
      future: puntosProvider.getListaCastillosPalacios(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SliderWidget(lista: snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
