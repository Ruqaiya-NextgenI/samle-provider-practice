import 'package:demotest/detailsproviderApp/model/expensiveobject.dart';
import 'package:demotest/detailsproviderApp/provider/objectprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final expensiveObject = context.select<ObjectProvider, ExpensiveObject>(
        (provider) => provider.expensiveObject,
    );
    return  Container(
      color: Colors.blue,
      height: 100,
      child:  Column(
        children: [
          const Text("Cheap Widget"),
          const Text('Last Updated'),
          Text(expensiveObject.lastUpdated.toString()),
        ],
      ),
    );
  }
}
