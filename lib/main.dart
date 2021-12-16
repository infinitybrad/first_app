import 'package:first_app/view/IdView.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('PurpleDog'),
          ),
          body: ListContainer())));
}

class ListContainer extends StatefulWidget {
  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {

final List<String> entries = <String>['topstories','newstories','askstories','showstories','jobstories'];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(entries[index]),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IdView(categoryName: entries[index])));
                  },
                );
              },
              separatorBuilder: (BuildContext context ,int index) => const Divider(), )
            )
        );
  }
}

