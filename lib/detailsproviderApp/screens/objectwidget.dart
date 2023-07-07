import 'package:demotest/detailsproviderApp/provider/objectprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ObjectProviderWidget extends StatelessWidget {
  const ObjectProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ObjectProvider>();

    return Container(
      color: Colors.purple,
      height: 100,
      child:  Column(
        children: [
          const Text("Object Provider Widget"),
          const Text('ID '),
          Text(provider.id),
        ],
      ),
    );
  }
}
