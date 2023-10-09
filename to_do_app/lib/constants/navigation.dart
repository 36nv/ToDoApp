import 'package:flutter/material.dart';

extension Nav on Widget {
  push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => this,
      ),
    );
  }
}

extension Pop on BuildContext {
  get pop => Navigator.pop(this);
}

extension NavigationExtensions on Widget {
  void pushAndRemoveUntilPage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => this),
      (route) => false,
    );
  }
}
