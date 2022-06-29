import 'package:flutter/material.dart';
import 'package:netflix/util/util.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.primaryColorLight,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 24,
      ),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/logo/logo_big.png',
              width: 10,
            ),
            const SizedBox(width: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('Series'),
                SizedBox(width: 12,),
                Text('Películas')
              ],
            )
          ],
        ),
      ),
    );
  }
}
