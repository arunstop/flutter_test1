import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Function roundedBorder = (int size) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(size.toDouble())));
};
