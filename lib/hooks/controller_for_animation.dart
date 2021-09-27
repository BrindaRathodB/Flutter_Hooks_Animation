import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Animation<Offset> useOffsetHook() {
  return use(_AnimOffsetForAnimationHook());
}

class _AnimOffsetForAnimationHook extends Hook<Animation<Offset>> {
  @override
  _AnimOffsetForAnimationHookState createState() => _AnimOffsetForAnimationHookState();
}

class _AnimOffsetForAnimationHookState extends HookState<Animation<Offset>, _AnimOffsetForAnimationHook> {
  late AnimationController _controller;
  late Animation<Offset> offset;

  @override
  void initHook() {
    _controller = useAnimationController(duration: Duration(seconds: 3), initialValue: 1);
    _controller.repeat(reverse: false, period: Duration(seconds: 4));

    offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero).animate(_controller);
    _controller.forward();
  }

  @override
  Animation<Offset> build(BuildContext context) => offset;

  @override
  void dispose() => _controller.dispose();
}

AnimationController useControllerForAnimation() {
  return use(_AnimControllerForAnimationHook());
}

class _AnimControllerForAnimationHook extends Hook<AnimationController> {
  @override
  _AnimControllerForAnimationHookState createState() => _AnimControllerForAnimationHookState();
}

class _AnimControllerForAnimationHookState extends HookState<AnimationController, _AnimControllerForAnimationHook> {
  late AnimationController _animController;

  @override
  void initHook() {
    _animController = useAnimationController(duration: Duration(seconds: 4), initialValue: 1);
    _animController.repeat(reverse: false);
  }

  @override
  AnimationController build(BuildContext context) => _animController;

  @override
  void dispose() => _animController.dispose();
}
