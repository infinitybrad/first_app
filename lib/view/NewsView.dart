

import 'package:flutter/material.dart';
import 'package:first_app/web/Service.dart';
import 'package:first_app/model/News.dart';

class NewsView extends StatelessWidget {

  final Service service = Service();
  final int newsID;

  
  NewsView({Key key, @required this.newsID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<News>(
          future: this.service.getNewsDetail(this.newsID),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.title);           
          } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
          }
          
          return CircularProgressIndicator();
          },
        ),
      ),
      
      
      
    );
  }
}
