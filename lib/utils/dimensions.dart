import 'package:flutter/material.dart';

class Dimen {
  static const double parentMargin = 30.0;
  static const double regularMargin = 8.0;
  static const double smallMargin = 4.0;

  static get regularPadding => EdgeInsets.all(parentMargin);
  static get smallPadding => EdgeInsets.all(smallMargin);
  static get zeroPadding => EdgeInsets.zero;
  static get onboardingPadding =>const EdgeInsets.symmetric(horizontal: 64.0);

}
