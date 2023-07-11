import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getTime () => Stream.periodic(
const Duration(seconds: 1),
(_) => DateTime.now().toIso8601String(),
);

class UseStreamDemoWidget extends HookWidget {
  const UseStreamDemoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Hooks Demo'),
        shadowColor: Colors.blue,
          surfaceTintColor: Colors.black,

      ),
      body: Container(
        color: Colors.white60,
        child: Center(child: Text(dateTime.data ?? 'Hooks')),
      ),
    );
  }
}
