import 'package:demotest/breadcrumApp/model/breadcrumb.dart';
import 'package:demotest/breadcrumApp/provider/breadcrumbprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBreadCrumb extends StatefulWidget {
  const AddBreadCrumb({super.key});

  @override
  State<AddBreadCrumb> createState() => _AddBreadCrumbState();
}

class _AddBreadCrumbState extends State<AddBreadCrumb> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('BreadCrumb'),
      ),
      body: Column(

        children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
              controller: _controller,
               decoration: const InputDecoration(
                 hintText: 'Enter a new bread crumb...'
               ),
          ),
           ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
                onPressed: (){
                  final text = _controller.text;
                  if(text.isNotEmpty){
                    final breadCrumb = BreadCrumb(
                        isActive: false,
                        name: text,
                    );
                    context.read<BreadCrumbProvider>().add(breadCrumb);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
            ),
          )
        ],
      ),
    );
  }

}
