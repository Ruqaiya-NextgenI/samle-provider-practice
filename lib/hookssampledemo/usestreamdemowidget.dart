import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getTime () => Stream.periodic(
const Duration(seconds: 1),
(_) => DateTime.now().toIso8601String(),
);

class UseStreamDemoWidget extends HookWidget {
  const UseStreamDemoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());

    final controller = useTextEditingController();
    final text = useState('');

    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    },
        
    [controller]);

    return  Scaffold(
      appBar: AppBar(
        title:  Text(text.value),
        shadowColor: Colors.blue,
        surfaceTintColor: Colors.black,

      ),
      body: Container(
        color: Colors.white60,
        child: Center(
            child: Column(
              children: [
                Text(
                    dateTime.data ?? 'Hooks',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextField(
                    controller: controller,

                  ),
                ),

              ],
            ),
        ),
      ),
    );
  }
}
