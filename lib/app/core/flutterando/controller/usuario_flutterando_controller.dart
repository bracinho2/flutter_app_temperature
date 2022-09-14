import 'package:flutter/material.dart';
import 'package:flutter_app_temperature/app/core/flutterando/model/flutterando_model.dart';
import 'package:flutter_app_temperature/app/core/flutterando/repository/flutterando_user_repository.dart';

class ControllerUsuario extends ChangeNotifier {
  final IUsuarioFlutterandoRepository repository;

  ControllerUsuario(this.repository);

  UsuarioFlutterando? usuario;

  var isLoading = false;
  var hasData = false;
  var hasError = false;

  void fetch() async {
    try {
      update(isLoading: true);
      await Future.delayed(
        const Duration(seconds: 2),
      );
      final result = await repository.call();
      update(hasData: true);

      usuario = result;
    } catch (e) {
      update(hasError: true);
    }
  }

  void update({
    bool isLoading = false,
    bool hasData = false,
    bool hasError = false,
  }) {
    this.isLoading = isLoading;
    this.hasData = hasData;
    this.hasError = hasError;

    notifyListeners();
  }
}
