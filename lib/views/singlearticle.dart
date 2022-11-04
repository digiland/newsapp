// ignore_for_file: must_be_immutable, unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class SingleArticle extends StatefulWidget {
  late String title, url;
  SingleArticle({super.key, required this.title, required this.url});

  @override
  State<SingleArticle> createState() => _SingleArticleState();
}

class _SingleArticleState extends State<SingleArticle> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // this is to bring the row text in center
          children: <Widget>[
            Text(
              "",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        //javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
