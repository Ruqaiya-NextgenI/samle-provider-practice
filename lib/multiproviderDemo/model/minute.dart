import 'package:demotest/multiproviderDemo/service/time.dart';
import 'package:flutter/material.dart';

@immutable
class Minute{

  final String value;

  Minute(): value = now();

  Stream<String> newStream(Duration duration) =>
      Stream.periodic(duration, (_) => now());


}
