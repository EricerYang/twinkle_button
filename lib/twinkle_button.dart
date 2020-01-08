import 'dart:async';

///
/// * author: EricerYang
/// * email: y_nan98@163.com
///
/// A package provides a button plug-in that can flash.
///

import 'package:flutter/material.dart';
import 'package:twinkle_button/shimmer.dart';

class TwinkleButton extends StatefulWidget {
  final Text buttonTitle;
  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final int durationTime;
  final int twinkleTime;
  final GestureTapCallback onclickButtonFunction;

  const TwinkleButton({
    Key key,
    @required this.buttonTitle,
    @required this.buttonColor,
    @required this.onclickButtonFunction,
    this.buttonHeight = 50.0,
    this.buttonWidth = 280.0,
    this.durationTime = 3,
    this.twinkleTime = 300,
  }) : super(key: key);

  @override
  _TwinkleButtonState createState() => _TwinkleButtonState();
}

class _TwinkleButtonState extends State<TwinkleButton>
    with SingleTickerProviderStateMixin {

  double _scale;
  AnimationController _controller;
  Timer _timer;
  int _twinkleCount;

  void _loopAnimation(int twinkleCount) {
    if(twinkleCount == 1) {
      setState(() {
        _timer = Timer(Duration(seconds: widget.durationTime), _twinkleForward,);
      });
    }
    else {
      _twinkleForward();
    }
  }

  @override
  void initState() {
    super.initState();
    _twinkleCount = 0;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.twinkleTime),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    })
      ..addStatusListener((listener) {
        if (listener == AnimationStatus.completed) {
          _controller.reverse();
        }
        else if (listener == AnimationStatus.dismissed) {
          if(_twinkleCount == 1) {
            _twinkleCount = 0;
          }
          else {
            _twinkleCount++;
          }
          _loopAnimation(_twinkleCount);
        }
      });
    _loopAnimation(_twinkleCount);
  }

  void _twinkleForward() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 + _controller.value;

    return GestureDetector(
      onTap: widget.onclickButtonFunction ?? () {},
      child: Transform.scale(
        scale: _scale,
        child: _twinkleButton,
      ),
    );
  }

  Widget get _twinkleButton => Container(
    child: Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            child: RaisedButton(
              onPressed: () async {
                return null;
              },
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 15.0,
                right: 15.0,
              ),
              textColor: Colors.white,
              color: widget.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          Container(
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Opacity(
              opacity: 0.6,
              child: Shimmer.fromColors(
                baseColor: widget.buttonColor,
                highlightColor: Colors.white,
                child: Container(
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  decoration: new BoxDecoration(
                    color: widget.buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Center(
              child: widget.buttonTitle,
            ),
          ),
        ],
      ),
    ),
  );

}
