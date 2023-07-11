import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class CountDown extends ValueNotifier<int>{
  late StreamSubscription sub;

  CountDown({
    required int from,
  }) :  super(from){
    sub = Stream.periodic(
        const Duration(seconds: 1),
            (v) => from - v,
    )
        .takeWhile(
            (value)
        => value >= 0,
    )
    .listen((event) {
      value = event;
    });

  }

@override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

}

class UseListenableDemo extends HookWidget {
  const UseListenableDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(from: 30)); //I want to create something, memoize just hold on to that
    //its caching countdown value rather than re-building widget
    final notifier = useListenable(countDown);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Count Down'),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
                notifier.value.toString(),
                style: const TextStyle(
                    color: Colors.white,
                  fontSize: 200,
                ),
              ),
          ),
        ),
      ),
    );
  }

}
