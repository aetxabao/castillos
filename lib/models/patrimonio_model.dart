// To parse this JSON data, do
//
//     final patrimonio = patrimonioFromJson(jsonString);

import 'dart:convert';

Patrimonio patrimonioFromJson(String str) =>
    Patrimonio.fromJson(json.decode(str));

String patrimonioToJson(Patrimonio data) => json.encode(data.toJson());

class Patrimonio {
  final _url = "https://www.turismo.navarra.es/imgs/rrtt/";

//"https://www.turismo.navarra.es/imgs/rrtt/03/01/00/00/5967FotoTH2.JPG";
  getImgUrl() {
    return _url + this.path + this.imgFichero;
  }

  Patrimonio({
    this.codrecurso,
    this.urlNombreCast,
    this.nombre,
    this.urlNombreBuscador,
    this.urlIdRecursoCategoria,
    this.codCategoria,
    this.idRecursoCategoria,
    this.idcategoria,
    this.nombreLocalidad,
    this.descripZona,
    this.path,
    this.imgFichero,
    this.tipo,
    this.estilo,
    this.distancia,
    this.georrX,
    this.georrY,
    this.diplomacompromiso,
  });

  String codrecurso;
  String urlNombreCast;
  String nombre;
  String urlNombreBuscador;
  String urlIdRecursoCategoria;
  String codCategoria;
  String idRecursoCategoria;
  String idcategoria;
  String nombreLocalidad;
  String descripZona;
  String path;
  String imgFichero;
  String tipo;
  String estilo;
  String distancia;
  String georrX;
  String georrY;
  String diplomacompromiso;

  factory Patrimonio.fromJson(Map<String, dynamic> json) => Patrimonio(
        codrecurso: json["Codrecurso"],
        urlNombreCast: json["URLNombreCast"],
        nombre: json["Nombre"],
        urlNombreBuscador: json["URLNombreBuscador"],
        urlIdRecursoCategoria: json["URLIdRecursoCategoria"],
        codCategoria: json["CodCategoria"],
        idRecursoCategoria: json["IdRecursoCategoria"],
        idcategoria: json["IDCATEGORIA"],
        nombreLocalidad: json["NombreLocalidad"],
        descripZona: json["DescripZona"],
        path: json["Path"],
        imgFichero: json["ImgFichero"],
        tipo: json["Tipo"],
        estilo: json["ESTILO"],
        distancia: json["Distancia"],
        georrX: json["GEORR_X"],
        georrY: json["GEORR_Y"],
        diplomacompromiso: json["DIPLOMACOMPROMISO"],
      );

  Map<String, dynamic> toJson() => {
        "Codrecurso": codrecurso,
        "URLNombreCast": urlNombreCast,
        "Nombre": nombre,
        "URLNombreBuscador": urlNombreBuscador,
        "URLIdRecursoCategoria": urlIdRecursoCategoria,
        "CodCategoria": codCategoria,
        "IdRecursoCategoria": idRecursoCategoria,
        "IDCATEGORIA": idcategoria,
        "NombreLocalidad": nombreLocalidad,
        "DescripZona": descripZona,
        "Path": path,
        "ImgFichero": imgFichero,
        "Tipo": tipo,
        "ESTILO": estilo,
        "Distancia": distancia,
        "GEORR_X": georrX,
        "GEORR_Y": georrY,
        "DIPLOMACOMPROMISO": diplomacompromiso,
      };
}
