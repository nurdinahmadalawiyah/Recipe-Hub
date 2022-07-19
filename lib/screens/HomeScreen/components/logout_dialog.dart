import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    Key? key,
  }) : super(key: key);

  void removeSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('access_token');
    await pref.remove('id');
  }

  // void getToken() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? token = pref.getString('access_token');
  //   String? id = pref.getString('id');
  //   print('access token : $token');
  //   print('user id : $id');
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // getToken();
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            removeSession();
            Navigator.pushReplacementNamed(context, 'welcome');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
