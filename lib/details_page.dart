import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:theme_provider/theme_provider.dart';

class DetailsPage extends StatelessWidget {
  final String source;
  final String urlImage;
  final String url;
  final String description;
  final String date;
  DetailsPage(
      this.source, this.date, this.description, this.url, this.urlImage);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.network(urlImage),
          Divider(
            color: ThemeProvider.themeOf(context).id == 'light'
                ? Colors.green
                : null,
            height: 0,
            thickness: 2,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(8, 20, 8, 10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(source),
                  Text(
                    date,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 20),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                description,
                style: TextStyle(fontSize: 20, fontFamily: 'Tajawal'),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45),
            child: RaisedButton(
              padding: const EdgeInsets.symmetric(vertical: 6),
              onPressed: () {
                launch(url);
              },
              child: Text(
                'للمزيد من التفاصيل',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
