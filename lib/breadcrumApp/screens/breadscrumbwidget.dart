import 'dart:collection';

import 'package:demotest/breadcrumApp/model/breadcrumb.dart';
import 'package:flutter/material.dart';

typedef OnTapBreadCrumbTap = void Function(BreadCrumb);

class BreadCrumbWidget extends StatelessWidget {
  final OnTapBreadCrumbTap onTapped;
  final UnmodifiableListView<BreadCrumb> breadCrumbs;

  const BreadCrumbWidget({
    super.key,
    required this.breadCrumbs,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {

    return Wrap(
      children: breadCrumbs.map(
              (bread) {
            return GestureDetector(
              onTap: (){
                onTapped(bread);
              },
              child: Text(
                bread.title,
                style: TextStyle(
                  color: bread.isActive ? Colors.blue : Colors.black,
                ),
              ),
            );
          }).toList(),
    );
  }
}
