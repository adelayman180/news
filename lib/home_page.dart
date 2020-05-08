import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './get_data_page.dart';
import './drawer.dart';

const String myKey = '4f187edb7a1b43cb8936161707574d4f';
const List<String> text = [
  'عـــام',
  'الصـحــة',
  'الاقتصـاد',
  'الريـاضـة',
  'العلــوم',
  'الفن والترفية',
  'التكنولوجيا'
];
const List<String> category = [
  'general',
  'health',
  'business',
  'sports',
  'science',
  'entertainment',
  'technology'
];
const List<IconData> icons = [
  FontAwesomeIcons.newspaper,
  FontAwesomeIcons.hospital,
  FontAwesomeIcons.businessTime,
  FontAwesomeIcons.volleyballBall,
  FontAwesomeIcons.briefcaseMedical,
  FontAwesomeIcons.star,
  FontAwesomeIcons.laptopCode
];

class HomePage extends StatelessWidget {
  final bool isDark;
  HomePage(this.isDark);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'حدد نوع الأخبار التي تريدهـا',
          style: TextStyle(fontFamily: 'Jomhuria', fontSize: 30),
        ),
      ),
      endDrawer: MyDrawer(isDark),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: 7,
        itemBuilder: (_, i) => Card(
          elevation: 5,
          color: isDark ? null : Color(0x7777ff77),
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => GetDataPage(i, isDark, 1)));
            },
            trailing: FaIcon(
              icons[i],
            ),
            title: Text(
              text[i],
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }
}
