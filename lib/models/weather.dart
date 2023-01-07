import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final Current current;
  final Location location;
  final ForeCast forecast;

  Weather(
      {required this.current, required this.location, required this.forecast});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "last_updated")
  final String lastUpdated;
  @JsonKey(name: "wind_kph")
  double windKph;
  @JsonKey(name: "wind_degree")
  double windDegree;
  @JsonKey(name: "feelslike_c")
  double feelslikeC;
  final Condition condition;

  Current(
      {required this.tempC,
      required this.lastUpdated,
      required this.condition,
      required this.feelslikeC,
      required this.windDegree,
      required this.windKph});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
  final String text;
  final String icon;

  Condition({required this.text, required this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Location {
  String name;
  String country;
  double lat;
  double lon;
  @JsonKey(name: "localtime")
  String localTime;

  Location(
      {required this.name,
      required this.country,
      required this.localTime,
      required this.lat,
      required this.lon});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ForeCast {
  List<ForeCastDay> forecastday;

  ForeCast({required this.forecastday});

  factory ForeCast.fromJson(Map<String, dynamic> json) =>
      _$ForeCastFromJson(json);

  Map<String, dynamic> toJson() => _$ForeCastToJson(this);
}

@JsonSerializable()
class ForeCastDay {
  Day day;
  String date;

  ForeCastDay({required this.date, required this.day});

  factory ForeCastDay.fromJson(Map<String, dynamic> json) =>
      _$ForeCastDayFromJson(json);

  Map<String, dynamic> toJson() => _$ForeCastDayToJson(this);
}

@JsonSerializable()
class Day {
  @JsonKey(name: "maxtemp_c")
  double maxTempC;
  @JsonKey(name: "mintemp_c")
  double minTempC;
  @JsonKey(name: "maxwind_kph")
  double maxWindKph;
  @JsonKey(name: "daily_chance_of_rain")
  double chanceOfRain;
  Condition condition;

  Day(
      {required this.maxTempC,
      required this.minTempC,
      required this.maxWindKph,
      required this.chanceOfRain,
      required this.condition});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
