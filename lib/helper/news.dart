import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/newsmodel.dart';

class News {
  // save json data inside this
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews() async {
    var newsURL =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=825fec5d2c67450ea196cdfc8d7f846b';
    var response = await http.get(Uri.parse(newsURL));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          // initliaze our model class

          ArticleModel articleModel = ArticleModel(
            //author: element['author'],
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );

          datatobesavedin.add(articleModel);
        }
      });
    }
  }
}

// fetching news by  category
class CategoryNews {
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews(String category) async {
    var newsURL =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=825fec5d2c67450ea196cdfc8d7f846b';
    var response = await http.get(Uri.parse(newsURL));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          // initliaze our model class

          ArticleModel articleModel = ArticleModel(
            //author: element['author'],
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );

          datatobesavedin.add(articleModel);
        }
      });
    }
  }
}
