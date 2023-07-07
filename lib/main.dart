import 'package:demotest/breadcrumApp/screens/addbreadcrumb.dart';
import 'package:demotest/detailsproviderApp/provider/objectprovider.dart';
import 'package:demotest/detailsproviderApp/screens/objecthome.dart';
import 'package:demotest/multiproviderDemo/model/minute.dart';
import 'package:demotest/multiproviderDemo/model/second.dart';
import 'package:demotest/multiproviderDemo/screens/minutescreen.dart';
import 'package:demotest/multiproviderDemo/screens/secondwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyAppMultiProvider(),

    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ObjectProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ObjectHome(),
        routes: {
          '/new': (context) => const AddBreadCrumb(),

        },
      ),
    );
  }
}

class MyAppMultiProvider extends StatelessWidget {

  const MyAppMultiProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [
          StreamProvider.value(
              value: Stream<Seconds>.periodic(
                    const Duration(
                    seconds: 1,
                    ),
                    (_) => Seconds(),
              ),
            initialData: Seconds(),
    ),
          StreamProvider.value(
            value: Stream<Minute>.periodic(
              const Duration(
                minutes: 1,
              ),
                  (_) => Minute(),
            ),
            initialData: Minute(),
          ),
        ],

      child:  const Column(
        children: [
          Row(
                children: [
                  SecondWidget(),
                  MinuteWidget(),
                ],
              ),
        ],
      ),

    );
  }
}


