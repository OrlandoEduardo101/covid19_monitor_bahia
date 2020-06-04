// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerCity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterCityController on _RegisterCityControllerBase, Store {
  final _$cityAtom = Atom(name: '_RegisterCityControllerBase.city');

  @override
  CityModel get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(CityModel value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$cityListAtom = Atom(name: '_RegisterCityControllerBase.cityList');

  @override
  ObservableStream<List<CityModel>> get cityList {
    _$cityListAtom.reportRead();
    return super.cityList;
  }

  @override
  set cityList(ObservableStream<List<CityModel>> value) {
    _$cityListAtom.reportWrite(value, super.cityList, () {
      super.cityList = value;
    });
  }

  final _$_RegisterCityControllerBaseActionController =
      ActionController(name: '_RegisterCityControllerBase');

  @override
  Stream<List<CityModel>> getList() {
    final _$actionInfo = _$_RegisterCityControllerBaseActionController
        .startAction(name: '_RegisterCityControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_RegisterCityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> set(CityModel city) {
    final _$actionInfo = _$_RegisterCityControllerBaseActionController
        .startAction(name: '_RegisterCityControllerBase.set');
    try {
      return super.set(city);
    } finally {
      _$_RegisterCityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> delete(CityModel model) {
    final _$actionInfo = _$_RegisterCityControllerBaseActionController
        .startAction(name: '_RegisterCityControllerBase.delete');
    try {
      return super.delete(model);
    } finally {
      _$_RegisterCityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
city: ${city},
cityList: ${cityList}
    ''';
  }
}
