import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../model/weather_state.dart';
import '../../../../utility/constants/colors.dart';
import '../state_management/weather_bloc.dart';

///Widget which displays information about the wind direction.
///This widget does not move with the devices compass
///This is a specific implementation using the BLoC package.
class WindDirectionDisplay extends StatelessWidget {
  ///Direction of the wind in degrees
  static const double _radius = 60;
  static const double _iconSize = 60;

  // ignore: public_member_api_docs
  const WindDirectionDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipOval(
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: Colors.white.withOpacity(0.75),
          constraints: BoxConstraints.tight(Size.fromRadius(_radius)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "N",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.red.shade800),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "E",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "W",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  color: shadowColor.withOpacity(0.5),
                  height: _radius * sqrt2,
                  width: 1,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  color: shadowColor.withOpacity(0.5),
                  width: _radius * sqrt2,
                  height: 1,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) => Transform.rotate(
                      angle: (state.wind.deg - 90) * pi / 180,
                      child: Icon(
                        FontAwesomeIcons.wind,
                        color: backgroundColor3,
                        size: _iconSize,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
