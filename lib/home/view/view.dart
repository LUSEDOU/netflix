import 'package:flutter/material.dart';
import 'package:netflix/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page<dynamic> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: ColoredBox(
        color: theme.canvasColor,
      ),
    );
  }
}
