import 'package:flutter/material.dart';
import 'package:flutter_app_temperature/app/core/flutterando/controller/usuario_flutterando_controller.dart';
import 'package:flutter_app_temperature/app/core/flutterando/repository/flutterando_user_repository.dart';
import 'package:flutter_app_temperature/app/core/forecast/view/forecast_view.dart';

class UsuariosFlutterandoView extends StatefulWidget {
  const UsuariosFlutterandoView({Key? key}) : super(key: key);

  @override
  State<UsuariosFlutterandoView> createState() =>
      _UsuariosFlutterandoViewState();
}

class _UsuariosFlutterandoViewState extends State<UsuariosFlutterandoView> {
  final controller = ControllerUsuario(UsuarioFlutterandoRepositoryImpl());

  @override
  void initState() {
    super.initState();
    controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 200,
          ),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              if (controller.isLoading) {
                return const CircularProgressIndicator();
              }
              if (controller.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.usuario!.login),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => ForecastView()),
                            ),
                          );
                        },
                        child: Image.network(
                          controller.usuario!.avatar_url,
                        )),
                  ],
                );
              }
              if (controller.hasError) return const Text('Error');
              return const Text('Opppsssss!');
            },
          ),
        ),
      ),
    );
  }
}
