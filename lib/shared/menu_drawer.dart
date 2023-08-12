import 'package:flutter/material.dart';
import '../screens/map_screen.dart';
import '../screens/screen1.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context){
    final List<String> menuTitles = [
      'Home',
      'Map',
      'page3',
      'page4',
    ];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text('Will Flutter Map',
          style: TextStyle(color: Colors.white, fontSize: 28))
    ));
    menuTitles.forEach((String element){
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element,
          style: const TextStyle(fontSize: 18)),
        onTap: () {
          switch(element){
            case 'Home':
              screen = Screen1();
              break;
            case 'Map':
              screen = MapSample();
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen)
          );
        }
      ));
    });
    return menuItems;
  }
}


