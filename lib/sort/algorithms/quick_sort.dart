import 'package:flutter_sort_visuals/sort/sort_data.dart';
import 'package:flutter_sort_visuals/sort/sort_stream.dart';

class QuickSort extends SortStream {
  @override
  sort() async {
    await quickSort(0, array.length - 1);
    controller.sink.add(SortData(array, Set()));
  }

  quickSort(low, hi) async {
    if (low < hi) {
      int pivot = await _partition(low, hi);
      await quickSort(low, pivot - 1);
      await quickSort(pivot + 1, hi);
    }
  }

  _partition(startIndex, endIndex) async {
    final pivot = array[endIndex];
    int i = startIndex;
    int j = endIndex;

    while (i < j) {
      while (array[i] < pivot) {
        i++;
      }

      while (array[j] > pivot) {
        j--;
      }

      final temp = array[i];
      array[i] = array[j];
      array[j] = temp;

      controller.sink.add(SortData(array, Set.from([i, j])));
      await Future.delayed(Duration(milliseconds: 10));
    }

    return j;
  }
}
