import 'package:flutter_app_temperature/app/core/flutterando/model/flutterando_model.dart';
import 'package:flutter_app_temperature/app/core/shared/service/service_api.dart';

abstract class IUsuarioFlutterandoRepository {
  Future<UsuarioFlutterando> call();
}

class UsuarioFlutterandoRepositoryImpl
    implements IUsuarioFlutterandoRepository {
  final cliente = HttpClientFlutterandoImpl();

  @override
  Future<UsuarioFlutterando> call() async {
    final response = await cliente.get();

    final usuario = UsuarioFlutterando.fromMap(response);

    return usuario;
  }
}
