import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  
  void showSnackbar(Widget content, Duration duration) =>
      ScaffoldMessenger.of(this)
          .showSnackBar(SnackBar(content: content, duration: duration));
}
