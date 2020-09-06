import 'package:flutter_sort_visuals/sort/algorithms/bubble_sort.dart';
import 'package:flutter_sort_visuals/sort/algorithms/quick_sort.dart';

class SortFactory {
  static get(SortAlgorithms algo) {
    switch (algo) {
      case SortAlgorithms.bubblesort:
        return BubbleSort();
      case SortAlgorithms.quicksort:
        return QuickSort();
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
