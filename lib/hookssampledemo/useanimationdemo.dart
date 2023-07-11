import 'dart:math';

import 'package:demotest/extensions/normalize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



const url = 'https://cdn.pixabay.com/photo/2023/07/01/18/21/water-8100724_640.jpg';
int imgHeight = 300;

class UseScrollDemo extends HookWidget {

  const UseScrollDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final opacity = useAnimationController(
     duration: const Duration(seconds: 1),
      initialValue: 1.0,
      upperBound: 1.0,
      lowerBound: 0.0,
    );

    final size = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      upperBound: 1.0,
      lowerBound: 0.0,
    );

    final controller = usePageController();

    useEffect(() {
      controller.addListener(() {
        final newOpacity = max(imgHeight - controller.offset, 0.0 );
        final normalized = newOpacity.normalized(0.0, imgHeight).toDouble();
        opacity.value = normalized;
        size.value = normalized;
      });
      return null;

    },
    [controller]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useAnimationController'),
      ),
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1.0,
            child: FadeTransition(
                opacity:opacity,
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: 100,
                itemBuilder: (builder, index){
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('NextGenI ${index + 1}'),
                  ),
                );
                }

            ),
          )
        ],
      ),
    );
  }
}
