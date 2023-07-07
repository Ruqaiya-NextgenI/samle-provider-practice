import 'package:demotest/detailsproviderApp/provider/objectprovider.dart';
import 'package:demotest/detailsproviderApp/screens/cheapobjectwidget.dart';
import 'package:demotest/detailsproviderApp/screens/expensivewidget.dart';
import 'package:demotest/detailsproviderApp/screens/objectwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ObjectHome extends StatelessWidget {

  const ObjectHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body:    Column(
        children: [
          const Row(
            children: [
              Expanded(child: CheapWidget()),
              Expanded(child: ExpensiveWidget()),
            ],
          ),
          const Row(
            children: [
              Expanded(child: ObjectProviderWidget()),
            ],
          ),
          Row(
            children: [
              TextButton(
                  onPressed: (){
                    context.read<ObjectProvider>().start();
                  },
                  child: const Text('Start'),
              ),
              TextButton(
                onPressed: (){
                  context.read<ObjectProvider>().stop();
                },
                child: const Text('Stop'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
