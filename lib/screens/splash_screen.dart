import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  var _iconAnimation;
  final String logo = 'assets/images/logo-white.png';
  final String bg = 'assets/images/bg3.jpg';

  void handleTimeout() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage(bg),
            fit: BoxFit.cover,
          ),
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.blue,
          //     Colors.green,
          //   ],
          // ),
        ),
        child: new Center(
          child: new Image(
            image: new AssetImage(logo),
            width: _iconAnimation.value * 100,
            height: _iconAnimation.value * 100,
          ),
        ),
      ),
    );
  }
}
