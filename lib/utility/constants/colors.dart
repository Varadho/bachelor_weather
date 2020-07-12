import 'dart:ui';

import 'package:flutter/cupertino.dart';

const Color backgroundColor1 = Color(0xFFFF329ec9);
const Color backgroundColor2 = Color(0xFFFF5bc5ef);
const Color backgroundColor3 = Color(0xFFFF32c9a8);
const Color iconColor = Color(0xFFFF91cae0);
const Color borderColor = Color.fromRGBO(145, 202, 224, 0.6);
const Color buttonColor = Color(0xFFFFf4d822);
const Color textColor = Color(0xFFFF051893);
const Color shadowColor = Color(0xFFFF5b7bef);
const Color cardColor = Color.fromRGBO(255, 255, 255, 0.25);
const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      backgroundColor1,
      backgroundColor2,
      backgroundColor3,
    ],
    stops: [
      0.2,
      0.7,
      1.0
    ]);
