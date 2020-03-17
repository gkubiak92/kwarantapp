import 'package:flutter/material.dart';
import 'package:kwarantapp/screens/measurements/measurements_screen.dart';
import 'package:kwarantapp/screens/rules/rules.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homecard.dart';

class HomeMenu extends StatelessWidget {
  _goToNews() async {
    const url = 'https://www.gov.pl/web/koronawirus';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Nie można otworzyć $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //child: Container(
      //color: Theme.of(context).primaryColor,
      // child: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(20.0),
      //       topRight: Radius.circular(20.0),
      //     ),
      //   ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            HomeCard(
              title: 'Zasady kwarantanny',
              image: Image.asset(
                'assets/rules.png',
                height: 80,
                fit: BoxFit.contain,
              ),
              onTap: () => Navigator.of(context).pushNamed(Rules.routeName),
            ),
            HomeCard(
              title: 'Pomiary',
              image: Image.asset(
                'assets/temperature.png',
                height: 80,
                fit: BoxFit.contain,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(MeasurementsScreen.routeName),
            ),
            HomeCard(
              title: 'Aktualności',
              image: Image.asset(
                'assets/information.png',
                height: 80,
                fit: BoxFit.contain,
              ),
              onTap: () => _goToNews(),
            ),
            HomeCard(
              title: 'Kontakt',
              image: Image.asset(
                'assets/question.png',
                fit: BoxFit.contain,
                height: 80,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
