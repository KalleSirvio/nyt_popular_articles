import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class UrlArguments {
  final String url;

  UrlArguments(
    this.url,
  );
}

class ArticleViewer extends StatelessWidget {
  const ArticleViewer({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    final args = ModalRoute.of(context)!.settings.arguments as UrlArguments;
    debugPrint(args.url);
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("NY Times"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: args.url,
      ),
    );
  }
}
