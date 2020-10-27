import 'package:flutter/material.dart';

import '../../ui/pages/bloc/bloc_page_big.dart';
import '../../ui/pages/mobx/mob_x_page.dart';
import '../../ui/pages/provider/provider_page.dart';
import '../../ui/pages/redux/redux_page.dart';
import '../../ui/pages/set_state/ss_page.dart';

enum StateMethod {
  ///setState
  // ignore: constant_identifier_names
  SS,

  ///Providers
  // ignore: constant_identifier_names
  PROVIDERS,

  ///Inherited Widget
  // ignore: constant_identifier_names
  MOBX,

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
      case StateMethod.MOBX:
        return "MobX";
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

  Route get route {
    switch (this) {
      case StateMethod.SS:
        return MaterialPageRoute(
          builder: (context) => SSPage(),
        );
      case StateMethod.PROVIDERS:
        return MaterialPageRoute(
          builder: (context) => ProviderPageSmall(),
        );
      case StateMethod.REDUX:
        return MaterialPageRoute(
          builder: (context) => ReduxPage(),
        );
      case StateMethod.MOBX:
        return MaterialPageRoute(
          builder: (context) => MobXPage(),
        );
      case StateMethod.BLOC:
        return MaterialPageRoute(
          builder: (context) => BlocPageBig(),
        );
      default:
        return null;
    }
  }
}
