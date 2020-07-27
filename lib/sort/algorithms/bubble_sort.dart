import 'package:flutter_sort_visuals/sort/sort_data.dart';
import 'package:flutter_sort_visuals/sort/sort_stream.dart';

class BubbleSort extends SortStream {
  @override
  sort() async {
    for (int i = 0; i < array.length - 1; i++) {
      for (int j = 0; j < array.length - 1 - i; j++) {
        if (array[j] > array[j + 1]) {
          final temp = array[j];
          array[j] = array[j + 1];
          array[j + 1] = temp;

          await Future.delayed(Duration(milliseconds: 10));
          controller.sink.add(SortData(array, Set.from([j, j + 1])));
        }
      }
    }

    controller.sink.add(SortData(array, Set()));
  }
}
