// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addCity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddCityController on _AddCityControllerBase, Store {
  final _$cityAtom = Atom(name: '_AddCityControllerBase.city');

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

  final _$valueAtom = Atom(name: '_AddCityControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_AddCityControllerBaseActionController =
      ActionController(name: '_AddCityControllerBase');

  @override
  Future<dynamic> set() {
    final _$actionInfo = _$_AddCityControllerBaseActionController.startAction(
        name: '_AddCityControllerBase.set');
    try {
      return super.set();
    } finally {
      _$_AddCityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
city: ${city},
value: ${value}
    ''';
  }
}
