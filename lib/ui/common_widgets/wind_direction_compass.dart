import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utility/constants/colors.dart';

///Widget which displays information about the wind direction.
///This widget rotates with the devices compass, if given permission
class WindDirectionCompass extends StatefulWidget {
  ///Direction of the wind in degrees
  final double windDegrees;

  // ignore: public_member_api_docs
  const WindDirectionCompass({Key key, this.windDegrees}) : super(key: key);

  @override
  _WindDirectionCompassState createState() => _WindDirectionCompassState();
}

class _WindDirectionCompassState extends State<WindDirectionCompass> {
  bool _hasPermissions = false;

  static const double _radius = 60;
  static const double _iconSize = 60;

  @override
  void initState() {
    Permission.locationWhenInUse.request().then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasPermissions) {
      return _buildCompass();
    } else {
      return _buildPermissionSheet();
    }
  }

  Widget _buildCompass() => StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                backgroundColor3.withOpacity(0.55),
              ),
            ),
          );
        }
        var northDegrees = snapshot.data.heading;
        return Transform.rotate(
          angle: (northDegrees * (-pi / 180)),
          child: ClipOval(
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "S",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "W",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
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
                      child: Transform.rotate(
                        angle: (widget.windDegrees - 90) * pi / 180,
                        child: Icon(
                          FontAwesomeIcons.wind,
                          color: backgroundColor3,
                          size: _iconSize,
                        ),
                      ),
                      //TODO Put the animation back in.
                      // PlayAnimation<double>(
                      //   duration: Duration(milliseconds: 2000),
                      //   curve: Curves.elasticOut,
                      //   tween: Tween<double>(
                      //       begin: (northDegrees - 90) * (pi / 180) +
                      //                   widget.windDegrees <=
                      //               180
                      //           ? 0
                      //           : 2 * pi,
                      //       end: (widget.windDegrees - 90) * pi / 180),
                      //   builder: (context, child, value) => Transform.rotate(
                      //     angle: value,
                      //     child: Icon(
                      //       FontAwesomeIcons.wind,
                      //       color: backgroundColor3,
                      //       size: _iconSize,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });

  Widget _buildPermissionSheet() => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Open App Settings'),
              onPressed: () async {
                Permission.sensors.request().isGranted.then((value) {});
              },
            )
          ],
        ),
      );
}
