import 'package:flutter/material.dart';

import 'weather_card.dart';

///Controls which display one of two Widgets, depending on whether they are
///expanded or not. Expansion can be achieved by tapping this Widget
class ExpandableControls extends StatefulWidget {
  ///The widgets which are to be displayed
  final Widget contracted, expanded;

  // ignore: public_member_api_docs
  const ExpandableControls({
    Key key,
    this.contracted,
    this.expanded,
  }) : super(key: key);

  @override
  _ExpandableControlsState createState() => _ExpandableControlsState();
}

class _ExpandableControlsState extends State<ExpandableControls>
    with SingleTickerProviderStateMixin {
  final Duration _animationDuration = Duration(milliseconds: 300);

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        child: WeatherCard(
          radius: _isExpanded ? 30 : 60,
          child: AnimatedSize(
            vsync: this,
            duration: _animationDuration,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: _isExpanded
                  ? addCloseIcon(widget.expanded)
                  : widget.contracted,
            ),
          ),
        ),
      );

  Widget addCloseIcon(Widget widget) => SizedBox(
        child: SizedBox(
          height: 225,
          child: Stack(
            children: <Widget>[
              widget,
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
        ),
      );
}
