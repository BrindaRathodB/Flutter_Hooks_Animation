import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_demo/hooks/controller_for_animation.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(Icons.home),
        title: Text("Home"),
      ),
      body: Center(child: Text("Welcome to Home screen!")),
      
    );
  }
}
