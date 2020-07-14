import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utility/constants/colors.dart';

class ProviderPage extends StatelessWidget {
  ProviderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<ListenableString>(
        create: (context) => ListenableString("Press the goddamn button!"),
        child: Builder(
          builder: (context) => Scaffold(
            backgroundColor: backgroundColor1,
            body: Center(
              child: Text(
                "Generated Token: ${context.watch<ListenableString>()}",
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Provider.of<ListenableString>(context, listen: false).value =
                    Random().nextInt(4294967296).toString();
              },
            ),
          ),
        ),
      );
}

class ListenableString with ChangeNotifier {
  String _value;

  ListenableString(this._value);

  String get value => _value;

  set value(String newValue) {
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => _value;
}
