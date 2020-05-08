import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int index = 0;
  final List<String> textOfPage = ['سهل وسريع', 'اختر ما تريد', 'اكتشف اكثر'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              itemCount: 3,
              itemBuilder: (_, i) => Column(
                children: <Widget>[
                  Image.asset(
                    'images/${1 + i}.png',
                    filterQuality: FilterQuality.high,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  Text(
                    textOfPage[i],
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                      height: i == 2 ? 50 : 75,
                      endIndent: 30,
                      indent: 30,
                      color: Colors.black26),
                  Text(
                    'Lorem ipsum dolor sit dim amet,'
                    ' mea regione diamet principes at.'
                    ' Cum no movi lorem ipsum dolor sit.',
                    style: TextStyle(fontFamily: 'Tajawal'),
                    textAlign: TextAlign.center,
                  ),
                  if (i == 2)
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        child: Text(
                          'ابدأ الان',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          _setData();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => HomePage(false)));
                        },
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 50),
                        color: Colors.green.shade900,
                        elevation: 5,
                      ),
                    )
                ],
              ),
              onPageChanged: (i) {
                setState(() {
                  index = i;
                });
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  iconData(index == 0),
                  iconData(index == 1),
                  iconData(index == 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Icon iconData(bool index) {
    return Icon(index ? CupertinoIcons.circle_filled : CupertinoIcons.circle);
  }

  _setData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('firstOpen', false);
  }
}
