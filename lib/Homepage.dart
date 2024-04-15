import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:weather_appbloc/bloc/weather_bloc.dart';
import 'package:weather_appbloc/loadpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          40,
          1,
          30,
          40,
        ),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherSuccess) {
              DateTime now = DateTime.now();
              // Determine if it's morning or not
              bool isMorning = now.hour < 12;
              bool isevening = now.hour > 12;

              return SizedBox(
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(3, -0.3),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-3, -0.3),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, -1.2),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 127, 51)),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '🌍 ${state.weather.areaName}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'lib/Assets/icons8-wind-symbol-100.png',
                                        scale: 4.4,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    isevening ? 'Good Evening' : 'Good Evening',
                                    semanticsLabel: isMorning
                                        ? 'Good Morning'
                                        : 'Good Morning',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromARGB(255, 255, 251, 251)),
                                  ),
                                  Text(
                                    '${state.weather.windSpeed.toString()} m/s',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              ),
                              getwethericon(
                                  state.weather.weatherConditionCode!),
                              Center(
                                child: Text(
                                  '${state.weather.temperature!.celsius!.round()}° C',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  state.weather.weatherMain!.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  DateFormat('EEEE dd .')
                                      .add_jmz()
                                      .format(state.weather.date!),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'lib/Assets/11.png',
                                          scale: 8,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sunrice',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              DateFormat('').add_jmz().format(
                                                  state.weather.sunrise!),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'lib/Assets/12.png',
                                            scale: 8,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Sunset',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                DateFormat('').add_jmz().format(
                                                    state.weather.sunset!),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10, top: 15),
                                  child: Divider(
                                    color: Color.fromARGB(255, 133, 132, 132),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'lib/Assets/13.png',
                                          scale: 8,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Temp MAX ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${state.weather.tempMax!.celsius!.round()} °',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'lib/Assets/14.png',
                                            scale: 8,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Temp MIN',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${state.weather.tempMin!.celsius!.round()} °',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Loadpage();
          },
        ),
      ),
    );
  }

  getwethericon(int code) {
    switch (code) {
      case > 200 && <= 300:
        return Image.asset('lib/Assets/1.png');

      case >= 300 && <= 400:
        return Image.asset('lib/Assets/2.png');

      case >= 500 && < 600:
        return Image.asset('lib/Assets/3.png');

      case > 600 && <= 700:
        Image.asset('lib/Assets/4.png');
        break;
      case > 700 && <= 800:
        return Image.asset('lib/Assets/5.png');

      case == 800:
        return Image.asset('lib/Assets/6.png');

      case > 800 && <= 804:
        return Image.asset('lib/Assets/7.png');

      default:
        return Image.asset('lib/Assets/7.png');
    }
  }
}
