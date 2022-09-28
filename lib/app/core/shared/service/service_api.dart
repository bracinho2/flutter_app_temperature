import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_temperature/app/core/api/api_routes.dart';
import 'package:flutter_app_temperature/app/core/shared/dummy_data/dummy_forecast.dart';
import 'package:http/http.dart' as http;

//1. Para essa atividade você deve criar uma Abstração do Cliente Http,
//você pode usar o package Dio, isolando-o do resto da aplicação.

//DIP > Dependecy Inversion Principle
abstract class HttpClient {
  Future<Map<String, dynamic>> get();
}

//OO - POLIMORFISMO
class HttpClientFlutterandoImpl implements HttpClient {
  Dio dio = Dio();
  @override
  Future<Map<String, dynamic>> get() async {
    final response = await dio.get(URLs.API_FLUTTERANDO);

    final value = Map<String, dynamic>.from(response.data);

    return value;
  }
}

class HttpForecastImplementation implements HttpClient {
  final httpClient = http.Client();

  var url = Uri(path: URLs.API_FORECAST);
  @override
  Future<Map<String, dynamic>> get() async {
    final response = await httpClient.get(url);

    //print(response.body);

    final value = jsonDecode(response.body);
    //print(value);

    return {};
  }
}

class DioForecastImplementation implements HttpClient {
  Dio dio = Dio();
  @override
  Future<Map<String, dynamic>> get() async {
    final response = await dio.get(URLs.API_FORECAST);

    //print(response.data);

    //final value = Map<String, dynamic>.from(response.data);
    final value = response.data;

    return value;
  }
}
