import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_provider/theme_provider.dart';
import './home_page.dart';
import './get_data_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeProvider.themeOf(context).id == 'light' ? false : true;
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
                        value: isDark,
                        onChanged: (_) =>
                            ThemeProvider.controllerOf(context).nextTheme()),
                  )
                : Column(
                    children: <Widget>[
                      Divider(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).canPop()
                              ? Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => ThemeConsumer(
                                          child: GetDataPage(i - 1, 1))))
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ThemeConsumer(
                                      child: GetDataPage(i - 1, 1))));
                        },
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
