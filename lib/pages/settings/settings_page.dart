import 'package:flutter/material.dart';

import 'package:znanija_clone/pages/account/account_page.dart';
import 'package:znanija_clone/pages/settings/widgets/logout_dialog.dart';
import 'package:znanija_clone/pages/settings/widgets/theme_dialog.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: ListTile.divideTiles(
          color: Colors.grey,
          context: context,
          tiles: [
            CustomListTile(
              title: 'Notification',
              onTap: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
            ),
            CustomListTile(
              title: 'Rate our app',
              onTap: () {},
              icon: const Icon(
                Icons.star,
                color: Colors.black,
                size: 30,
              ),
            ),
            CustomListTile(
              title: 'Theme',
              onTap: () {
                showThemeDialog(context);
              },
              icon: const Icon(
                Icons.palette,
                color: Colors.black,
                size: 30,
              ),
            ),
            CustomListTile(
              title: 'Help',
              onTap: () {},
              icon: const Icon(
                Icons.help_rounded,
                color: Colors.black,
                size: 30,
              ),
            ),
            CustomListTile(
              title: 'Contact us',
              onTap: () {},
              icon: const Icon(
                Icons.mail,
                color: Colors.black,
                size: 30,
              ),
            ),
            CustomListTile(
              title: 'Log out',
              onTap: () {
                showLogoutDialog(context);
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ).toList(),
      ),
    );
  }
}
