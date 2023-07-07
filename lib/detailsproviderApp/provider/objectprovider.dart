import 'dart:async';

import 'package:demotest/detailsproviderApp/model/cheapobject.dart';
import 'package:demotest/detailsproviderApp/model/expensiveobject.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ObjectProvider extends ChangeNotifier{

  late String id;
  late CheapObject _cheapObject;
  late StreamSubscription _cheapObjectSubs;
  late ExpensiveObject _expensiveObject;
  late StreamSubscription _expensiveObjectSubs;

  ObjectProvider()
      : id = const Uuid().v4(),
        _cheapObject = CheapObject(),
        _expensiveObject = ExpensiveObject(){
    start();
  }

  @override
  void notifyListeners(){
    id = const Uuid().v4();
    super.notifyListeners();
  }

  CheapObject get cheapObject => _cheapObject;

  ExpensiveObject get expensiveObject => _expensiveObject;

  void start(){
    //for cheap widget
    _cheapObjectSubs = Stream.periodic(
        const Duration(
          seconds: 1,
        ),
    ).listen(
            (_) {
             _cheapObject = CheapObject();
             notifyListeners();
            });

    //for expensive widget
    _expensiveObjectSubs = Stream.periodic(
      const Duration(
        seconds: 10,
      ),
    ).listen(
            (_) {
          _expensiveObject = ExpensiveObject();
          notifyListeners();
        });
  }

  void stop(){
    _cheapObjectSubs.cancel();
    _expensiveObjectSubs.cancel();
  }

}