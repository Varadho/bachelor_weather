import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utility/constants/colors.dart';

class ProviderPage extends StatelessWidget {
  ProviderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<Token>(
        create: (context) => Token("Press the goddamn button!"),
        child: Scaffold(
          backgroundColor: backgroundColor1,
          body: Center(
            child: Builder(
              builder: (context) => Text(
                "Generated Token: ${context.watch<Token>().value}",
              ),
            ),
          ),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () {
                Provider.of<Token>(context, listen: false).value =
                    Random().nextInt(4294967296).toString();
              },
            ),
          ),
        ),
      );
}

// ignore: prefer_mixin
class Token with ChangeNotifier {
  String _value;
  Token(this._value);

  String get value => _value;

  set value(String newValue) {
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => _value;
}
