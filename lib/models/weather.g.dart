// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      forecast: ForeCast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'current': instance.current,
      'location': instance.location,
      'forecast': instance.forecast,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      tempC: (json['temp_c'] as num).toDouble(),
      lastUpdated: json['last_updated'] as String,
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      feelslikeC: (json['feelslike_c'] as num).toDouble(),
      windDegree: (json['wind_degree'] as num).toDouble(),
      windKph: (json['wind_kph'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'temp_c': instance.tempC,
      'last_updated': instance.lastUpdated,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'feelslike_c': instance.feelslikeC,
      'condition': instance.condition,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      text: json['text'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String,
      country: json['country'] as String,
      localTime: json['localtime'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'localtime': instance.localTime,
    };

ForeCast _$ForeCastFromJson(Map<String, dynamic> json) => ForeCast(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForeCastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForeCastToJson(ForeCast instance) => <String, dynamic>{
      'forecastday': instance.forecastday.map((e) => e.toJson()).toList(),
    };

ForeCastDay _$ForeCastDayFromJson(Map<String, dynamic> json) => ForeCastDay(
      date: json['date'] as String,
      day: Day.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForeCastDayToJson(ForeCastDay instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      maxTempC: (json['maxtemp_c'] as num).toDouble(),
      minTempC: (json['mintemp_c'] as num).toDouble(),
      maxWindKph: (json['maxwind_kph'] as num).toDouble(),
      chanceOfRain: (json['daily_chance_of_rain'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'mintemp_c': instance.minTempC,
      'maxwind_kph': instance.maxWindKph,
      'daily_chance_of_rain': instance.chanceOfRain,
      'condition': instance.condition,
    };
