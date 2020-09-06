import 'package:flutter/material.dart';
import 'package:flutter_sort_visuals/sort/algorithms/base_sort.dart';
import 'package:flutter_sort_visuals/sort/sort_data.dart';
import 'package:flutter_sort_visuals/sort/sort_factory.dart';
import 'package:flutter_sort_visuals/sort/sort_stream.dart';
import 'package:flutter_sort_visuals/widgets/settings_sheet.dart';
import 'package:flutter_sort_visuals/widgets/value_box.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SortStream sortStream = SortStream();

  BaseSort sorter;

  @override
  void initState() {
    super.initState();
    sorter = SortFactory.get(SortAlgorithms.quicksort, sortStream);
  }

  setSortAlgo(SortAlgorithms algo) {
    setState(() {
      sorter = SortFactory.get(algo, sortStream);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => showSettings(this.context, setSortAlgo)),
        ],
      ),
      body: StreamBuilder<SortData>(
          stream: sortStream.stream,
          initialData: SortData([], Set()),
          builder: (context, snapshot) {
            return Center(
              child: ListView.builder(
                  itemCount: snapshot.data.array.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ValueBox(
                        value: snapshot.data.array[index].toDouble(),
                        highlighted:
                            snapshot.data.compareIndeices.contains(index),
                      ),
                    );
                  }),
            );
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: sorter.sort,
              child: Icon(Icons.sort),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: sortStream.randomize,
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
