import 'package:flutter/material.dart';

extension WidgetSpacing on double {
  /// Adds an empty spacing on the horizontal axis of the a widget tree
  SizedBox get spacingW => SizedBox(width: this);

  /// Adds an empty spacing on the vertical axis of the a widget tree
  SizedBox get spacingH => SizedBox(height: this);
}
