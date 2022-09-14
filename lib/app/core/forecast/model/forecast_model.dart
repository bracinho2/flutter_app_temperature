class ActualForecast {
  final String temperature;
  final String wind;
  final String description;
  final List<FutureForecast> futureForecast;

  ActualForecast({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.futureForecast,
  });

  factory ActualForecast.fromMap(Map<String, dynamic> json) {
    return ActualForecast(
      temperature: json['temperature'],
      wind: json['wind'],
      description: json['description'],
      futureForecast: json['forecast']
          .map<FutureForecast>((forecast) => FutureForecast.fromMap(forecast))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Actual Forecast: Temperature: $temperature | Wind: $wind | Description: $description';
  }
}

class FutureForecast {
  final String day;
  final String temperature;
  final String wind;

  FutureForecast(
      {required this.day, required this.temperature, required this.wind});

  factory FutureForecast.fromMap(Map<String, dynamic> json) {
    return FutureForecast(
      temperature: json['temperature'],
      wind: json['wind'],
      day: json['day'],
    );
  }

  @override
  String toString() {
    return 'Future Forecast: Day: $day | Temperature: $temperature | Wind: $wind \n';
  }
}
