part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherFetching extends WeatherEvent {
  final Position position;
  WeatherFetching(this.position);
  List<Object> get props => [position];
}
