import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleInputButton extends StatelessWidget {
  final String text;
  final Sink<String> enteredSink;
  final Color dotTextColor;
  final Color dotFocusedColor;

  CircleInputButton({
    @required this.text,
    @required this.enteredSink,
    @required this.dotTextColor,
    @required this.dotFocusedColor,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.095,
      color: dotTextColor,
    );

    return RaisedButton(
      child: Text(
        text,
        style: textStyle,
      ),
      onPressed: () {
        enteredSink.add(text);
      },
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.transparent,
          width: 0,
          style: BorderStyle.solid,
        ),
      ),
      color: Colors.transparent,
      elevation: 0,
      highlightColor: dotFocusedColor.withOpacity(0.55),
    );
  }
}
