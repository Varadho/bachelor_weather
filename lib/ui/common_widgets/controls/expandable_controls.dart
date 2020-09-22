import 'package:flutter/material.dart';

import '../weather_card.dart';

class ExpandableControls extends StatefulWidget {
  final Widget contracted, _expanded;

  Widget get expanded => SizedBox(
        height: 210,
        child: Stack(
          children: <Widget>[
            _expanded,
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      );
  const ExpandableControls({Key key, this.contracted, Widget expanded})
      : _expanded = expanded,
        super(key: key);

  @override
  _ExpandableControlsState createState() => _ExpandableControlsState();
}

class _ExpandableControlsState extends State<ExpandableControls>
    with SingleTickerProviderStateMixin {
  final Duration animationDuration = Duration(milliseconds: 300);

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        child: WeatherCard(
          radius: _isExpanded ? 30 : 60,
          child: AnimatedSize(
            vsync: this,
            duration: animationDuration,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: _isExpanded ? widget.expanded : widget.contracted,
            ),
          ),
        ),
      );
}
