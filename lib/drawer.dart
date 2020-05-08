import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home_page.dart';
import './get_data_page.dart';
import './loading_page.dart';

class MyDrawer extends StatefulWidget {
  final bool isDark;
  MyDrawer(this.isDark);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 8,
            itemBuilder: (_, i) => i == 0
                ? ListTile(
                    trailing: FaIcon(FontAwesomeIcons.moon),
                    title: Text(
                      'الوضع المظلم',
                      style: TextStyle(fontFamily: 'Jomhuria', fontSize: 25),
                      textAlign: TextAlign.right,
                    ),
                    leading: Switch(
                        value: widget.isDark,
                        onChanged: (val) async {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: Text(
                                      'الوضع المظلم',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontFamily: 'Jomhuria', fontSize: 25),
                                    ),
                                    content: Text(
                                      'يجب إعادة تشغيل البرنامج لكي يظهر التغير',
                                      style: TextStyle(fontFamily: 'Tajawal'),
                                      textAlign: TextAlign.right,
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () async {
                                          Navigator.pop(ctx);
                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                          pref.setBool('isDark', val);
                                        },
                                        child: Text('لاحقاً'),
                                      ),
                                      FlatButton(
                                        onPressed: () async {
                                          Navigator.pop(ctx);
                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                          pref.setBool('isDark', val);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      LoadingPage()));
                                        },
                                        child: Text('الأن'),
                                      ),
                                    ],
                                  ));
                        }),
                  )
                : Column(
                    children: <Widget>[
                      Divider(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (_) =>
                                    GetDataPage(i - 1, widget.isDark, 1))),
                        trailing: FaIcon(
                          icons[i - 1],
                        ),
                        title: Text(
                          text[i - 1],
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  )),
      ),
    );
  }
}
