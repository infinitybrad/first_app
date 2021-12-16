

import 'package:first_app/view/NewsView.dart';
import 'package:flutter/material.dart';
import 'package:first_app/web/Service.dart';

class IdView extends StatelessWidget {

  final Service service = Service();
  final String categoryName;

  
  
  IdView({Key key, @required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UI를 그리기 위해 Todo를 사용합니다.
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<List>(
          future: this.service.getCategoryIDs(this.categoryName),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${snapshot.data[index]}'),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsView(newsID:snapshot.data[index])));
                  }
                );
              },
            );
          } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
          }
          // 기본적으로 로딩 Spinner를 보여줍니다.
          return CircularProgressIndicator();
          },
        ),
      ),
      
      
      
    );
  }
}