import 'package:flutter_sort_visuals/sort/algorithms/bubble_sort.dart';
import 'package:flutter_sort_visuals/sort/algorithms/quick_sort.dart';
import 'package:flutter_sort_visuals/sort/sort_stream.dart';

class SortFactory {
  static get(SortAlgorithms algo, SortStream stream) {
    switch (algo) {
      case SortAlgorithms.bubblesort:
        return BubbleSort(stream);
      case SortAlgorithms.quicksort:
        return QuickSort(stream);
      default:
        throw Exception("unknown sort");
    }
  }
}

enum SortAlgorithms { bubblesort, quicksort }

const SortAlgorithmNames = {
  [SortAlgorithms.quicksort]: "Quick Sort",
  [SortAlgorithms.bubblesort]: "Bubble Sort",
};
