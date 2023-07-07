
import 'package:demotest/multiproviderDemo/model/minute.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinuteWidget extends StatelessWidget {

  const MinuteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mints = context.watch<Minute>();
    return  Expanded(
      child: Container(
        height: 100,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(mints.value),
        ),
      ),
    );
  }
}
