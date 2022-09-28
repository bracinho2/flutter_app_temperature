import 'package:flutter_app_temperature/app/core/forecast/model/forecast_model.dart';
import 'package:flutter_app_temperature/app/core/shared/service/service_api.dart';

abstract class IForecastRepository {
  Future<ActualForecast> call();
}

class ForecastRepositoryImpl implements IForecastRepository {
  final HttpClient _httpClient;

  ForecastRepositoryImpl(this._httpClient);
  @override
  Future<ActualForecast> call() async {
    final response = await _httpClient.get();
    final forecast = ActualForecast.fromMap(response);

    return forecast;
  }
}
