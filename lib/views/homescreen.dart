// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:newsapp/helper/catergorydata.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/views/catergorypage.dart';
import 'package:newsapp/views/singlearticle.dart';
import '../model/catergorymodel.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: unused_field
  bool _loading = true;
  // ignore: deprecated_member_use
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  getNews() async {
    News newsdata = News();
    await newsdata.getNews();
    articles = newsdata.datatobesavedin;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "News APP",
            )),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ))
            : SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70.0,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          },
                        ),
                      ),
                      Container(
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
                    ],
                  ),
                ),
              ));
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryName, imageUrl;
  const CategoryTile(
      {super.key, required this.categoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryFragment(
                category: categoryName.toLowerCase(),
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageUrl,
                  width: 170,
                  height: 90,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 170,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewsTemplate extends StatelessWidget {
  String title, description, url, urlToImage;
  NewsTemplate(
      {super.key,
      required this.title,
      required this.description,
      required this.urlToImage,
      required this.url});

  late Uri webLink = Uri.parse(url);

  Future<void> _launchUrl() async {
    if (!await launchUrl(webLink)) {
      throw 'Could not launch $webLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //debugPrint(url);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleArticle(
                  title: title,
                  url: url,
                ),
              ));
        },
        child: GestureDetector(
          onTap: _launchUrl,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Image.network(
                      urlToImage,
                      width: 380,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 130, 5, 5),
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            backgroundColor: Color(0xAB000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        ));
  }
}
