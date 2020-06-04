import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'textError_controller.g.dart';

class TextErrorController = _TextErrorControllerBase with _$TextErrorController;

abstract class _TextErrorControllerBase with Store {
  @observable
  Color color = Colors.indigo;

  @action
  Color setColor(value) => (color = value);

}
