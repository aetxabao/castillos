import 'package:castillos/models/patrimonio_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {
  final List<Patrimonio> lista;

  SwiperWidget({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _swiper(context),
    );
  }

  Widget _swiper(context) {
    final screenSize = MediaQuery.of(context).size;
    return Swiper(
      itemWidth: screenSize.width * 0.7,
      itemHeight: screenSize.height * 0.5,
      layout: SwiperLayout.STACK,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          // child: Image.network(
          //   "http://via.placeholder.com/350x150",
          //   fit: BoxFit.fill,
          // ),
          child: FadeInImage(
            placeholder: AssetImage('assets/images/cast.jpg'),
            image: NetworkImage(lista[index].getImgUrl()),
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: lista.length,
      // pagination: new SwiperPagination(),
      // control: new SwiperControl(),
    );
  }
}
