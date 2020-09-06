import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sort_visuals/sort/sort_factory.dart';

showSettings(context, onChange) {
  var algos = SortAlgorithmNames.keys;

  onSelectedItemChanged(index) {
    onChange(algos.elementAt(index).first);
  }

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
          height: 300,
          color: Colors.white,
          child: CupertinoPicker(
            children: SortAlgorithmNames.keys
                .map((e) => Text(SortAlgorithmNames[e]))
                .toList(),
            itemExtent: 30,
            onSelectedItemChanged: onSelectedItemChanged,
          ));
    },
  );
}
