import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_demo/home_page.dart';

bool useTimerToNavigate() {
  return use(const _NavigateTimer());
}

class _NavigateTimer extends Hook<bool> {
  const _NavigateTimer();

  @override
  ___NavigateTimerState createState() => ___NavigateTimerState();
}

class ___NavigateTimerState extends HookState<bool, _NavigateTimer> {
  late Timer _timer;
  bool isRedirect = false;

  @override
  void initHook() {
    super.initHook();
    _timer = Timer(Duration(seconds: 4), () {
      Route route = MaterialPageRoute(builder: (context) => HomePage());
      Navigator.of(context).pushReplacement(route);
    });
  }

  @override
  bool build(BuildContext context) {
    return isRedirect;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
