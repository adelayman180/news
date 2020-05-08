import 'package:flutter/material.dart';
import './guide_page.dart';
import './home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool firstOpen = pref.getBool('firstOpen') ?? true;
    bool isDark = pref.getBool('isDark') ?? false;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => MaterialApp(
              home: firstOpen ? GuidePage() : HomePage(isDark),
              theme: isDark
                  ? ThemeData.dark()
                  : ThemeData(
                      primaryColor: Colors.green.shade900,
                      accentColor: Colors.green.shade900),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
