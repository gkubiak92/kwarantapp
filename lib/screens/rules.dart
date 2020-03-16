import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:kwarantapp/screens/home.dart';

class Rules extends StatelessWidget {
  static const routeName = '/rules';

  final pageList = [
    PageModel(
      title: Text('Myj ręce'),
      color: Colors.indigoAccent,
      body: Text(
        'Dokładnie myj ręce!',
        textAlign: TextAlign.center,
      ),
      iconAssetPath: 'wash-hands.png',
      heroAssetPath: 'wash-hands.png',
    ),
    PageModel(
      title: Text('Myj ręce'),
      color: Colors.redAccent,
      body: Text(
        'Dokładnie myj ręce!',
        textAlign: TextAlign.center,
      ),
      iconAssetPath: 'wash-hands.png',
      heroAssetPath: 'wash-hands.png',
    ),
    PageModel(
      title: Text('Myj ręce'),
      color: Colors.orangeAccent,
      body: Text(
        'Dokładnie myj ręce!',
        textAlign: TextAlign.center,
      ),
      iconAssetPath: 'wash-hands.png',
      heroAssetPath: 'wash-hands.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: 'Powrót',
        skipButtonText: 'Dalej',
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
      ),
    );
  }
}
