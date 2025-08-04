import 'package:database/screens/shared_prefarence/login_screen.dart';
import 'package:database/screens/shared_prefarence/sharePrefarencUtils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefanceHomeScreen extends StatelessWidget {
  const SharedPrefanceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Home'),
      ElevatedButton(onPressed: () async {
        final sherePrf = await SharedPreferences.getInstance();
        sherePrf.setBool(LoginKey, false);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginScreen(),));


      }, child: Text('Log Out'))
    ],
  ),
),
    );
  }
}
