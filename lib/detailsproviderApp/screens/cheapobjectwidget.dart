import 'package:demotest/detailsproviderApp/model/cheapobject.dart';
import 'package:demotest/detailsproviderApp/provider/objectprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheapWidget extends StatelessWidget {
  const CheapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final cheapObject = context.select<ObjectProvider, CheapObject>(
          (provider) => provider.cheapObject,
    );
    return  Container(
      color: Colors.green,
      height: 100,
      child:  Column(
        children: [
           const Text("Expensive Widget"),
           const Text('Last Updated'),
           Text(cheapObject.lastUpdated.toString()),
        ],
      ),
    );
  }
}
