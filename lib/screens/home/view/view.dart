import 'package:flutter/material.dart';
import 'package:netflix/util/theme.dart';
import 'package:netflix/util/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page<dynamic> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: screensize,
        child: const CustomAppBar(), 
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: theme.primaryColorLight,
        ),
      ),
    );
  }
}
