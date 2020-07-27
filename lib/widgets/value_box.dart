import 'package:flutter/material.dart';

class ValueBox extends StatelessWidget {
  final double value;
  final bool highlighted;

  final _alpha;
  final _r;
  final _g;
  final _b;

  ValueBox({Key key, this.value, this.highlighted})
      : _alpha = highlighted ? 255 : ((value / 10) * 255).floor(),
        _r = highlighted ? 255 : ((value / 10) * 255).floor(),
        _g = 0,
        _b = highlighted ? 0 : 255,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      decoration: BoxDecoration(
        color: Color.fromARGB(_alpha, _r, _g, _b),
      ),
      height: 5,
    );
  }
}
