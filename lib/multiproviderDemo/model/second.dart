import 'package:demotest/multiproviderDemo/service/time.dart';
import 'package:flutter/material.dart';

@immutable
class Seconds{
  final String value;

  Seconds(): value = now();
}
