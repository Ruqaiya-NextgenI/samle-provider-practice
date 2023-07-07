import 'package:demotest/multiproviderDemo/model/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondWidget extends StatelessWidget {

  const SecondWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final seconds = context.watch<Seconds>();

    return  Expanded(
      child: Container(
        height: 100,
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(seconds.value),
        ),
      ),
    );

  }
}
