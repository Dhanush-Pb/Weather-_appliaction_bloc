import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherFetching>((event, emit) async {
      emit(WeatherLoading());

      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        print(weather);
        emit(WeatherSuccess(weather: weather));
      } catch (e) {
        emit(WeatherError());
      }
      // double latitude = 37.7749;
      // double log = -122.4194;
      // String ate = "2024-04-15";

      // try {
      //   final response = await http.get(Uri.parse(
      //       "https://api.openweathermap.org/data/2.5/onecall?lat=${latitude}&lon=${log}&exclude=minutely,hourly&appid={api_key}&units=metric&dt=${ate}"));

      //   if (response.statusCode == 200) {
      //     final dynamic data = json.decode(response.body);
      //     print(data);
      //     final weather = Weather(data);

      //     emit(WeatherSuccess(weather: weather));
      //   } else {
      //     throw Exception('Failed to load weather data');
      //   }
      // } catch (e) {
      //   emit(WeatherError());
      // }
    });
  }
}

String API_KEY = "ce392dadab5529ff20c68f745cb58181";
