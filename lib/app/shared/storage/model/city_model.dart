import 'package:cloud_firestore/cloud_firestore.dart';

class CityModel {
  String name;
  String uf;
  String suspeitos;
  String confirmados;
  String importados;
  String monitoramento;
  String descartados;
  String curados;
  String obitos;
  DocumentReference reference;

  CityModel({this.name='', this.uf='', this.suspeitos='', this.confirmados='',
    this.importados='', this.monitoramento='', this.descartados='', this.curados='', this.reference, this.obitos='',});

  factory CityModel.fromDocument(DocumentSnapshot doc) {
    return CityModel(
      name: doc["name"],
      uf: doc['uf'],
      suspeitos: doc['suspeitos'],
      confirmados: doc['confirmados'],
      importados: doc['importados'],
      monitoramento: doc['monitoramento'],
      descartados: doc['descartados'],
      curados: doc['curados'],
      obitos: doc['obitos'],
      reference: doc.reference,
     // position: doc['position'],
    );
  }

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json["name"],
      uf: json['uf'],
      suspeitos: json['suspeitos'],
      confirmados: json['confirmados'],
      importados: json['importados'],
      monitoramento: json['monitoramento'],
      descartados: json['descartados'],
      curados: json['curados'],
      obitos: json['obitos'],
        );
  }

  Map<String, dynamic> toJson() => {};
}
