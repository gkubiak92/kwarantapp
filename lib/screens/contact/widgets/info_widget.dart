import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String phoneNumber;

  const InfoWidget({Key key, this.title, this.phoneNumber}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  phoneNumber,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.phone_forwarded),
                  iconSize: 48.0,
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _call(phoneNumber),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
