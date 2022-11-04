// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryFragment extends StatefulWidget {
  String category;
  CategoryFragment({required this.category});
  @override
  _CategoryFragmentState createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  getNews() async {
    CategoryNews newsdata = CategoryNews();
    await newsdata.getNews(widget.category);
    articles = newsdata.datatobesavedin;
    setState(() {
      // important method otherwise you would have to perform hot relod always
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // this is to bring the row text in center
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Text(
                widget.category.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

      // category widgets
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ))
          : SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                  itemCount: articles.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true, // add this otherwise an error
                  itemBuilder: (context, index) {
                    return NewsTemplate(
                      urlToImage: articles[index].urlToImage,
                      title: articles[index].title,
                      description: articles[index].description,
                      url: articles[index].url,
                    );
                  },
                ),
              ),
            ),
    );
  }
}

class NewsTemplate extends StatelessWidget {
  String title, description, url, urlToImage;
  NewsTemplate(
      {required this.title,
      required this.description,
      required this.urlToImage,
      required this.url});

  late Uri webLink = Uri.parse(url);

  Future<void> _launchUrl() async {
    print(webLink);
    if (!await launchUrl(webLink)) {
      throw 'Could not launch $webLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  urlToImage,
                  width: 380,
                  height: 200,
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
