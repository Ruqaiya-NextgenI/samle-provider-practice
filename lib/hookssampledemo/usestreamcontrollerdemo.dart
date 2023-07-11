import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url = 'https://cdn.pixabay.com/photo/2023/07/01/18/21/water-8100724_640.jpg';

class UseStreamControllerDemo extends HookWidget {

  const UseStreamControllerDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;
    controller = useStreamController<double>(
      onListen: () {
        controller.sink.add(0.0);
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('useStreamController'),
      ),
      body: StreamBuilder<double>(
        stream: controller.stream,
        builder: (context, snapshot){
          final rotation = snapshot.data ?? 0.0;
          if(!snapshot.hasData){
            return const CircularProgressIndicator();
          } else {
            return GestureDetector(
              onTap: () {
                controller.sink.add(rotation + 10.0);
              },
              child: RotationTransition(
                turns:  AlwaysStoppedAnimation(rotation / 360),
                child: Center(child: Image.network(url),
                ),
              ),
            );
          }
        },
      )
    );
  }
}
