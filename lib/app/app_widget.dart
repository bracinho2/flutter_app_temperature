import 'package:flutter/material.dart';
import 'package:flutter_app_temperature/app/core/flutterando/view/usuarios_flutterando_view.dart';
import 'package:flutter_app_temperature/app/core/forecast/view/forecast_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forecast',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.orange,
      ),
      home: const UsuariosFlutterandoView(),
    );
  }
}
