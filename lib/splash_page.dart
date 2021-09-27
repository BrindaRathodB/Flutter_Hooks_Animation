import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_demo/home_page.dart';
import 'package:flutter_hooks_demo/hooks/controller_for_animation.dart';
import 'package:flutter_hooks_demo/hooks/timer_hook.dart';
import 'package:overlay_support/overlay_support.dart';

class SplashScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    AnimationController _animationController = useControllerForAnimation();
    Animation<Offset> offset = useOffsetHook();
 
    useTimerToNavigate();

    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xffE3F3FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            FadeTransition(
                opacity: _animationController,
                child: Center(
                  child: FlutterLogo(
                    size: 50,
                  ),
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: offset,
                  child: Image.asset(
                    'assets/images/splash_bg.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
