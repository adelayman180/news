import 'package:flutter/material.dart';
import './guide_page.dart';
import './home_page.dart';
import 'package:theme_provider/theme_provider.dart';
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

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => ThemeProvider(
              loadThemeOnInit: true,
              saveThemesOnChange: true,
              themes: [
                AppTheme(
                    id: 'light',
                    data: ThemeData(
                      primaryColor: Colors.green.shade900,
                      accentColor: Colors.green.shade900,
                      cardColor: Colors.green,
                    ),
                    description: 'light'),
                AppTheme(
                    id: 'dark', data: ThemeData.dark(), description: 'light')
              ],
              defaultThemeId: 'light',
              child: MaterialApp(
                home:
                    firstOpen ? GuidePage() : ThemeConsumer(child: HomePage()),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
