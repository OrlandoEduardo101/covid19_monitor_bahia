// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$cityAtom = Atom(name: '_HomeControllerBase.city');

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

  final _$cityListAtom = Atom(name: '_HomeControllerBase.cityList');

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

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  Stream<List<CityModel>> getList() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
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
