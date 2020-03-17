import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:kwarantapp/screens/home/home.dart';
import 'package:kwarantapp/screens/rules/widgets/rule_desc.dart';
import 'package:kwarantapp/screens/rules/widgets/rule_title.dart';

class RulesScreen extends StatelessWidget {
  static const routeName = '/rules';

  final pageList = [
    PageModel(
      title: RuleTitle(title: 'Nie opuszczaj domu'),
      color: Colors.deepOrangeAccent,
      body: RuleDescription(
        description:
            'Na czas trwania kwarantanny zostań w domu. Odpocznij, poczytaj, pograj, nadrób zalegości w serialach. Rób na co masz ochotę, ale w domu.',
      ),
      iconAssetPath: 'assets/fall.png',
      heroAssetPath: 'assets/fall.png',
    ),
    PageModel(
      title: RuleTitle(title: 'MyjRęce'),
      color: Colors.indigoAccent,
      body: RuleDescription(
        description:
            'Dokładnie myj ręce! Użyj mydła lub płynu dezynfekującego i poświęć na to co najmniej 20 sekund.',
      ),
      iconAssetPath: 'assets/wash.png',
      heroAssetPath: 'assets/wash.png',
    ),
    PageModel(
      title: RuleTitle(
        title: 'Zakrywaj się',
      ),
      color: Colors.deepPurpleAccent,
      body: RuleDescription(
        description:
            'Podczas kichania lub kasłania staraj się zakrywać lub odruchowo kierować ruch w zgięcie łokciowe!',
      ),
      iconAssetPath: 'assets/sneeze.png',
      heroAssetPath: 'assets/sneeze.png',
    ),
    PageModel(
      title: RuleTitle(
        title: 'Grzywna za nieprzestrzeganie kwarantanny',
      ),
      color: Colors.redAccent,
      body: RuleDescription(
        description:
            'Za nieprzestrzeganie kwarantanny grozi grzywna do 5 tys. zł!',
      ),
      iconAssetPath: 'assets/sad.png',
      heroAssetPath: 'assets/sad.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        showSkipButton: false,
        doneButtonText: 'Powrót',
        skipButtonText: 'Dalej',
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
      ),
    );
  }
}
