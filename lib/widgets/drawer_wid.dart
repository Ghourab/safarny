import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Menu extends ConsumerWidget {
  Menu({Key? key}) : super(key: key);
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context, ref) {
    return Drawer(
      child: Column(children: [
        SizedBox(
          height: 100,
          child: Container(
              color: Color.fromARGB(255, 255, 199, 31),
              child: Center(child: Text('Menu'))),
        ),
        ListTile(
          title: Text('Profile'),
          onTap: () => {},
        ),
        ListTile(
          title: Text('Settings'),
          onTap: () => {},
        ),
        ListTile(
          title: Text('Change Theme'),
          onTap: () => {},
        ),
        ListTile(
          title: Text('Volume'),
          onTap: () => {},
        ),
        ListTile(
          title: Text('Rating'),
          onTap: () => {},
        ),
        ListTile(
          title: Text('Giveaways'),
          onTap: () => {},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          onTap: () => {},
        )
      ]),
    );
  }
}
