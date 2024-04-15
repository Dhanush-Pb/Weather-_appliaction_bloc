part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherError extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final Weather weather;

  WeatherSuccess({required this.weather});

  List<Object> get props => [weather];
}
