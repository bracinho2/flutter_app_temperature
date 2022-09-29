import 'package:flutter/material.dart';
import 'package:flutter_app_temperature/app/core/forecast/controller/forecast_controller.dart';
import 'package:flutter_app_temperature/app/core/forecast/repository/forecast_repository.dart';
import 'package:flutter_app_temperature/app/core/forecast/view/components/future_forecast_card_widget.dart';
import 'package:flutter_app_temperature/app/core/shared/service/service_api.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({Key? key}) : super(key: key);

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  final controller =
      ForecastController(ForecastRepositoryImpl(DioForecastImplementation()));

  @override
  void initState() {
    super.initState();
    controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              if (controller.isLoading) {
                return const CircularProgressIndicator();
              }
              if (controller.hasData) {
                final futureForecast = controller.forecast!.futureForecast;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Unipar',
                      style: TextStyle(
                        fontFamily: 'ROBOTO',
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      controller.forecast!.description,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      controller.forecast!.temperature,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        itemCount: futureForecast.length,
                        itemBuilder: ((context, index) =>
                            FutureForecastCardWidget(
                              day: futureForecast[index].day,
                              temperature: futureForecast[index].temperature,
                              wind: futureForecast[index].wind,
                            )),
                      ),
                    ),
                  ],
                );
              }
              if (controller.hasError) return const Text('Error Forecast');
              return const Text('Opppsssss!');
            },
          ),
        ),
      ),
    );
  }
}
