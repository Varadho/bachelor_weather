import 'package:flutter/material.dart';

import '../../ui/bloc_page.dart';
import '../../ui/inherited_page.dart';
import '../../ui/provider_page.dart';
import '../../ui/redux_page.dart';
import '../../ui/ss_page.dart';

enum StateMethod {
  ///setState
  // ignore: constant_identifier_names
  SS,

  ///Inherited Widget
  // ignore: constant_identifier_names
  INHERITED,

  ///Providers
  // ignore: constant_identifier_names
  PROVIDERS,

  ///Redux package
  // ignore: constant_identifier_names
  REDUX,

  ///Bussines Logic Components
  // ignore: constant_identifier_names
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

  dynamic get route {
    switch (this) {
      case StateMethod.SS:
        return (argument) => PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (context, animation, secondaryAnimation) => SSPage(
                transitionAnimation: animation,
                initialWeather: argument,
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
