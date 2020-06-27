import 'package:bachelorweather/ui/bloc_page.dart';
import 'package:bachelorweather/ui/inherited_page.dart';
import 'package:bachelorweather/ui/provider_page.dart';
import 'package:bachelorweather/ui/redux_page.dart';
import 'package:bachelorweather/ui/ss_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum StateMethod {
  ///setState
  SS,

  ///Inherited Widget
  INHERITED,

  ///Providers
  PROVIDERS,

  ///Redux package
  REDUX,

  ///Bussines Logic Components
  BLOC,
}

extension Utility on StateMethod {
  String get name {
    switch (this) {
      case StateMethod.SS:
        return "setState((){})";
      case StateMethod.INHERITED:
        return "Inherited Widgets";
      case StateMethod.PROVIDERS:
        return "Providers";
      case StateMethod.REDUX:
        return "Redux";
      case StateMethod.BLOC:
        return "Bussines Logic Components";
      default:
        return "What?!";
    }
  }

  IconData get icon {
    switch (this) {
      case StateMethod.SS:
        return Icons.airline_seat_individual_suite;
      case StateMethod.INHERITED:
        return Icons.airline_seat_flat;
        break;
      case StateMethod.PROVIDERS:
        return Icons.airline_seat_flat_angled;
        break;
      case StateMethod.REDUX:
        return Icons.airline_seat_recline_normal;
        break;
      case StateMethod.BLOC:
        return Icons.airline_seat_recline_extra;
        break;
      default:
        return Icons.error_outline;
    }
  }

  PageRoute get route {
    switch (this) {
      case StateMethod.SS:
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (context, animation, secondaryAnimation) => SSPage(
            transitionAnimation: animation,
          ),
        );
      case StateMethod.INHERITED:
        return MaterialPageRoute(
          builder: (context) => InheritedPage(),
        );
      case StateMethod.PROVIDERS:
        return MaterialPageRoute(
          builder: (context) => ProviderPage(),
        );
      case StateMethod.REDUX:
        return MaterialPageRoute(
          builder: (context) => ReduxPage(),
        );
      case StateMethod.BLOC:
        return MaterialPageRoute(
          builder: (context) => BlocPage(),
        );
      default:
        return null;
    }
  }
}
