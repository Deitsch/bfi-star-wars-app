import 'package:flutter/material.dart';

enum NavTab { home, planets }

extension TabData on NavTab {
  String get name {
    return switch (this) {
      NavTab.home => "Home",
      NavTab.planets => "Planets",
    };
  }

  IconData get icon {
    return switch (this) {
      NavTab.home => Icons.home,
      NavTab.planets => Icons.public,
    };
  }
}
