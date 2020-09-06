import 'package:flutter_sort_visuals/sort/sort_stream.dart';

abstract class BaseSort {
  final SortStream stream;

  Duration delay = Duration(milliseconds: 100);

  BaseSort(this.stream);

  sort();
}
