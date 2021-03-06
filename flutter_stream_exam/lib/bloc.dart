import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Bloc {
  int count = 0;
  final _event = BehaviorSubject<int>(); //StreamController<int>();
  final _event2 = StreamController<int>.broadcast();

  Stream<int> get event => _event.stream;
  Stream<int> get event2 => _event2.stream;


   click() {
     if(_event.value == null) {
       _event.sink.add(0);
     } else {
       print(_event.value);
       _event.sink.add(_event.value + 1);
       _event2.sink.add(count++);
     }
   }

   dispose() {
     _event.close();
   }
}