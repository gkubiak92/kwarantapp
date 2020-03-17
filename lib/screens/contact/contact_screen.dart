import 'package:flutter/material.dart';
import 'package:kwarantapp/screens/contact/widgets/info_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact';

  _call(String phoneNumber) async {
    var url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Nie można wybrać numeru $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontakt'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/question.png',
                width: MediaQuery.of(context).size.width / 3,
              ),
            ],
          ),
          Text(
            'Potrzebujesz pomocy?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20,
          ),
          InfoWidget(
            title: 'Podejrzewasz zakażenie koronawirusem?',
            phoneNumber: '800 190 590',
          ),
          InfoWidget(
            title:
                'Potrzebujesz dowiedzieć się więcej o dodatkowym zasiłku opiekuńczym?',
            phoneNumber: '22 560 16 00',
          ),
        ],
      ),
    );
  }
}
