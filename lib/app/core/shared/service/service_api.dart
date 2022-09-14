import 'package:dio/dio.dart';
import 'package:flutter_app_temperature/app/core/api/api_routes.dart';
import 'package:flutter_app_temperature/app/core/shared/dummy_data/dummy_forecast.dart';

//1. Para essa atividade você deve criar uma Abstração do Cliente Http,
//você pode usar o package Dio, isolando-o do resto da aplicação.

//DIP > Dependecy Inversion Principle
abstract class HttpClient {
  Future<Map<String, dynamic>> fetch();
}

//OO - POLIMORFISMO
class HttpClientFlutterandoImpl implements HttpClient {
  Dio dio = Dio();
  @override
  Future<Map<String, dynamic>> fetch() async {
    final response = await dio.get(URLs.API_FLUTTERANDO);

    final value = Map<String, dynamic>.from(response.data);

    return value;
  }
}

class HttpClientForecastImpl implements HttpClient {
  Dio dio = Dio();
  @override
  Future<Map<String, dynamic>> fetch() async {
    final response = await dio.get(URLs.API_FORECAST);

    //final value = Map<String, dynamic>.from(response.data);
    final value = response.data;

    return value;
  }
}
