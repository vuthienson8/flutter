
import 'package:application/page/drawer/widgets/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            accountName: Text('UserName'),
            accountEmail: Text('yourAccount@gmail.com'),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('App Settings'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsView();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
