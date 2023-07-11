
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url = 'https://cdn.pixabay.com/photo/2013/12/17/13/57/cheque-guarantee-card-229830_640.jpg';

class UseLifeCycleDemo extends HookWidget {

  const UseLifeCycleDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final state= useAppLifecycleState();



    return Scaffold(
        appBar: AppBar(
          title: const Text('uselifecycle'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Opacity(
            opacity: state == AppLifecycleState.resumed ? 1.0 : 0.0,
            child: Container(
              child: Center(child: Image.network(url),
              ),
            ),
          ),
        )
    );
  }
}
