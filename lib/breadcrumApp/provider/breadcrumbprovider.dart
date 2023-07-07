import 'dart:collection';
import 'package:demotest/breadcrumApp/model/breadcrumb.dart';
import 'package:flutter/material.dart';

class BreadCrumbProvider extends ChangeNotifier{
  final List<BreadCrumb> _items = [];

  UnmodifiableListView<BreadCrumb> get item => UnmodifiableListView(_items);

  void add(BreadCrumb breadCrumb){
    for( var i in _items){
      i.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void reset(){
    _items.clear();
    notifyListeners();
  }

}