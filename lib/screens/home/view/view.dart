import 'package:flutter/material.dart';
import 'package:netflix/util/theme.dart';
import 'package:netflix/util/widgets/custom_app_bar.dart';
import 'package:netflix/util/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page<dynamic> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: theme.primaryColorLight,
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: listItemBottom,
        showUnselectedLabels: true,
      ),
    );
  }
}

List<BottomNavigationBarItem> listItemBottom = const [
  BottomNavigationBarItem(
    icon: Icon(Icons.abc),
    label: 'inicio',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.abc),
    label: 'juegos',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.abc),
    label: 'Nuevo y Popular',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.abc),
    label: 'Para reír',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.abc),
    label: 'Descargas',
  ),
];
