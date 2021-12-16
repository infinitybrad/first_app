
import 'dart:convert';
import 'package:first_app/model/News.dart';
import 'package:first_app/web/UrlData.dart';
import 'package:http/http.dart' as http;

class Service {


   Future<List> getCategoryIDs(String id) async {
    
    String url = UrlData.urlForCategoryID(id);
    
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List ids = jsonDecode(response.body);
      return ids;
    } else {
      throw Exception("Unable to fetch data!");
    }
  }



  Future<News> getNewsDetail(int id) async {
    
    String url = UrlData.urlForDetailInfo(id);
    
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception("Unable to fetch data!");
    }
  }

  



}