import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import './drawer.dart';
import './details_page.dart';
import './home_page.dart';
import './get_data_page.dart';

class ResultPage extends StatelessWidget {
  final data;
  final int catog;
  final bool isDark;
  ResultPage(this.catog, this.isDark, this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(isDark),
      backgroundColor: isDark ? null : Color(0xffdddddd),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          text[catog],
          style: TextStyle(fontFamily: 'Jomhuria', fontSize: 50),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data['articles'].length + 1,
        itemBuilder: (_, i) => i == data['articles'].length
            ? Column(
                children: <Widget>[
                  Divider(height: 50),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int numOfData = (data['totalResults'] / 20).ceil();
                            numOfData > 0;
                            numOfData--)
                          RowPagesItem(catog, isDark, numOfData),
                      ],
                    ),
                  ),
                ],
              )
            : InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailsPage(
                        isDark,
                        data['articles'][i]['source']['name'],
                        formatDate(
                            DateTime.parse(
                                    '${data['articles'][i]['publishedAt']}')
                                .add(Duration(hours: 2)),
                            [
                              yyyy,
                              '/',
                              m,
                              '/',
                              d,
                              '  ',
                              h,
                              ':',
                              nn,
                              '  ',
                              am
                            ]).toString(),
                        data['articles'][i]['description'],
                        data['articles'][i]['url'],
                        data['articles'][i]['urlToImage']),
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: isDark ? null : Color(0x7777ff77),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              data['articles'][i]['source']['name'],
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatDate(
                                  DateTime.parse(
                                          '${data['articles'][i]['publishedAt']}')
                                      .add(Duration(hours: 2)),
                                  [
                                    yyyy,
                                    '/',
                                    m,
                                    '/',
                                    d,
                                    '  ',
                                    h,
                                    ':',
                                    nn,
                                    '  ',
                                    am
                                  ]).toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              data['articles'][i]['urlToImage'],
                              height: MediaQuery.of(context).size.width / 1.5,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                height: MediaQuery.of(context).size.width / 4.4,
                                color: Colors.black45,
                                child: Text(data['articles'][i]['title'],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'Tajawal')),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class RowPagesItem extends StatelessWidget {
  RowPagesItem(this.catog, this.isDark, this.text);
  final int text;
  final bool isDark;
  final int catog;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 20),
      height: 50,
      width: 50,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: isDark ? ThemeData.dark().cardColor : Color(0xaaaaffaa),
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (_) => GetDataPage(catog, isDark, text))),
        child: Text(text.toString()),
      ),
    );
  }
}
