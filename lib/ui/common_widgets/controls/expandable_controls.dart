import 'package:flutter/material.dart';

import '../weather_card.dart';

class ExpandableControls extends StatefulWidget {
  final Widget contracted, expanded;

  const ExpandableControls({Key key, this.contracted, this.expanded})
      : super(key: key);
  @override
  _ExpandableControlsState createState() => _ExpandableControlsState();
}

class _ExpandableControlsState extends State<ExpandableControls>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  final Duration animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        child: WeatherCard(
          radius: _isExpanded ? 30 : 60,
          child: AnimatedSize(
            vsync: this,
            duration: animationDuration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _isExpanded ? widget.expanded : widget.contracted,
            ),
          ),
        ),
      );
}
