import 'package:flutter/material.dart';
import 'package:flutter_app_temperature/app/core/forecast/model/forecast_model.dart';
import 'package:flutter_app_temperature/app/core/forecast/repository/forecast_repository.dart';

class ForecastController extends ChangeNotifier {
  final IForecastRepository _iForecastRepository;

  ForecastController(this._iForecastRepository);

  var isLoading = false;
  var hasData = false;
  var hasError = false;

  ActualForecast? forecast;

  Future<void> fetch() async {
    try {
      update(isLoading: true);
      // await Future.delayed(
      //   const Duration(seconds: 2),
      // );
      final result = await _iForecastRepository.call();
      update(hasData: true);

      forecast = result;
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
