import 'package:castillos/models/patrimonio_model.dart';
import 'package:castillos/screens/mapa_screen.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final List<Patrimonio> lista;

  SliderWidget({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _slider(context),
    );
  }

  Widget _slider(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.7),
        children: _elementos(context),
      ),
    );
  }

  List<Widget> _elementos(BuildContext context) {
    final List<Widget> lst = [];
    lista.forEach((p) {
      final c = GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MapaScreen(patrimonio: p)));
        },
        child: Container(
          margin: EdgeInsets.only(right: 20.0),
          child: Hero(
            tag: p.codrecurso,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/cast.jpg'),
                image: AssetImage(p.getImgPath()),
                fit: BoxFit.cover,
                height: 120.0,
              ),
            ),
          ),
        ),
      );
      lst.add(c);
    });
    return lst;
  }
}
