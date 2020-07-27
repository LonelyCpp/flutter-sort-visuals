import 'dart:async';

import 'dart:math';

import 'package:flutter_sort_visuals/sort/sort_data.dart';

abstract class SortStream {
  final randomizer = Random();
  static const MAX_VAL = 20;
  static const MIN_VAL = 10;

  List<double> array;
  Stream<SortData> stream;
  StreamController<SortData> controller = StreamController<SortData>();

  SortStream() {
    stream = controller.stream;
    randomize();
  }

  randomize() {
    array = [];
    for (int i = 0; i < 100; i++) {
      array.add(randomizer.nextDouble() * (MAX_VAL - MIN_VAL) + MIN_VAL);
    }

    final data = SortData(array, Set());
    controller.sink.add(data);
  }

  close() {
    controller.close();
  }

  sort();
}
