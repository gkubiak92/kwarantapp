import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      //color: Theme.of(context).primaryColor,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'kwarantApp',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
