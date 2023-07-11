import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url = 'https://cdn.pixabay.com/photo/2023/07/01/18/21/water-8100724_640.jpg';

enum Action {
  rotateRight, rotateLeft, moreVisible, lessVisible
}

@immutable
class State{
  final double rotateDeg;
  final double alpha;

  const State({
    required this.rotateDeg,
    required this.alpha,
  });

  const State.zero()
      : rotateDeg= 0.0,
        alpha = 1.0;

  State rotateRight() => State(rotateDeg: rotateDeg + 10.0, alpha: alpha);

  State rotateLeft() => State(rotateDeg: rotateDeg - 10.0, alpha: alpha);

  State increaseAlpha() => State(rotateDeg: rotateDeg, alpha: min(alpha + 0.1, 1.0));

  State decreaseAlpha() => State(rotateDeg: rotateDeg, alpha: max(alpha - 0.1, 0.0));

}

State reducer(State oldState, Action? action){
  switch(action){
    case Action.rotateRight:
      return oldState.rotateRight();
    case Action.rotateLeft:
      return oldState.rotateLeft();
    case Action.lessVisible:
      return oldState.decreaseAlpha();
    case Action.moreVisible:
      return oldState.increaseAlpha();
    case null:
      return oldState;
  }
}

class UseReducerControllerDemo extends HookWidget {

  const UseReducerControllerDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final store = useReducer<State, Action?>(
      reducer,
      initialState: const State.zero(),
      initialAction: null,
    );


    return Scaffold(
        appBar: AppBar(
          title: const Text('useReducerController'),
        ),
        body:  Column(
          children: [
             Padding(
              padding:  const EdgeInsets.all(8.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (){
                      store.dispatch(Action.rotateLeft);
                      },
                    child: const Text(
                      'Rotate Left',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){store.dispatch(Action.rotateRight);
                    },
                    child: const Text(
                      'Rotate Right',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      store.dispatch(Action.lessVisible);
                    },
                    child: const Text(
                      'less visible',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      store.dispatch(Action.moreVisible);
                    },
                    child: const Text(
                      'more visible',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 200,),
            Opacity(
              opacity: store.state.alpha,
              child: RotationTransition(
                turns:  AlwaysStoppedAnimation(store.state.rotateDeg / 360),
                child: Center(child: Image.network(url),
                ),
              ),
            ),
          ],
        )
    );
  }
}
