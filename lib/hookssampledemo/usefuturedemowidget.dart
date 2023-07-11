import 'package:demotest/extensions/compactmap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class UseFutureDemoWidget extends HookWidget {
  const UseFutureDemoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const imgUrl = 'https://cdn.pixabay.com/photo/2023/07/04/09/06/bicycle-8105731_640.jpg';
    /*final myImg = useFuture(
        NetworkAssetBundle(
            Uri.parse(imgUrl)
        )
            .load(imgUrl)
            .then(
              (data)
          => data.buffer.asUint8List(),
        )
            .then(
              (data)
          => Image.memory(data),
        )
    );*/
    //caches a complex object.that is caching future img
    final myFutureImg = useMemoized(() =>

        NetworkAssetBundle(
            Uri.parse(imgUrl)
        )
            .load(imgUrl)
            .then(
              (data)
          => data.buffer.asUint8List(),
        )
            .then(
              (data)
          => Image.memory(data),
        ),

    );

    final snapShotImage = useFuture(myFutureImg);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useFuture Demo'),
      ),
      body: Column(
        children: [
          snapShotImage.data,
        ].compactMap().toList(),
      ),
    );
  }
}
