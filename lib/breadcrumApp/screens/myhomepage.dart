import 'package:demotest/breadcrumApp/provider/breadcrumbprovider.dart';
import 'package:demotest/breadcrumApp/screens/breadscrumbwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<BreadCrumbProvider>(
            builder: (context, value, child ){
              return BreadCrumbWidget(
                breadCrumbs: value.item, onTapped: (BreadCrumb ) {
                // print(BreadCrumb.title);
              },
              );
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/new',
              );
            },
            child: const Text(
              "Add new bread Crumb",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<BreadCrumbProvider>().reset();
            },
            child: const Text(
              "Reset",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
