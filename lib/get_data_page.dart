import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './home_page.dart';
import 'dart:convert';
import './result_page.dart';

class GetDataPage extends StatefulWidget {
  final int pageNum;
  final int catog;
  final bool isDark;
  GetDataPage(this.catog, this.isDark, this.pageNum);
  @override
  _GetDataPageState createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=eg&category=${category[widget.catog]}&page=${widget.pageNum}&apiKey=$myKey';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => ResultPage(widget.catog, widget.isDark, data)));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: Center(child: CircularProgressIndicator()));
  }
}
