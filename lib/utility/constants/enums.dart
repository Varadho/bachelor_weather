import 'package:flutter/material.dart';

import '../../ui/pages/all_pages.dart';
import '../../ui/pages/bloc/bloc_page.dart';

///Enumeration of all state management methods that are compared in this
///application
enum StateMethod {
  ///setState
  // ignore: constant_identifier_names
  SS,

  ///Providers
  // ignore: constant_identifier_names
  PROVIDERS,

  ///Redux package
  // ignore: constant_identifier_names
  REDUX,

  ///Bussines Logic Components
  // ignore: constant_identifier_names
  BLOC,

  ///Inherited Widget
  // ignore: constant_identifier_names
  MOBX,
}

///An Extension on the [StateMethod] enumeration to provide extra utility for
/// each case class
extension Utility on StateMethod {
  ///Name of the [StateMethod]
  String get name {
    switch (this) {
      case StateMethod.SS:
        return "setState((){})";
      case StateMethod.MOBX:
        return "MobX";
      case StateMethod.PROVIDERS:
        return "Providers";
      case StateMethod.REDUX:
        return "Redux";
      case StateMethod.BLOC:
        return "Business Logic Components";
      default:
        return "Homepage???";
    }
  }

  ///Icon associated with the [StateMethod]
  IconData get icon {
    switch (this) {
      case StateMethod.SS:
        return Icons.airline_seat_individual_suite;
      case StateMethod.PROVIDERS:
        return Icons.airline_seat_flat;
        break;
      case StateMethod.MOBX:
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

  ///A Route to the page which uses the given [StateMethod]
  Route get route => MaterialPageRoute(builder: (context) => page);

  ///The Page implemented using the given [StateMethod]
  Widget get page {
    switch (this) {
      case StateMethod.SS:
        return SSPage();
        break;
      case StateMethod.PROVIDERS:
        return ProviderPage();
        break;
      case StateMethod.MOBX:
        return MobXPage();
        break;
      case StateMethod.REDUX:
        return ReduxPage();
        break;
      case StateMethod.BLOC:
        return BlocPage();
        break;
      default:
        return HomePage();
        break;
    }
  }
}
