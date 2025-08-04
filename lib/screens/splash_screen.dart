import 'package:database/screens/shared_prefarence/login_screen.dart';
import 'package:database/screens/shared_prefarence/sharePrefarencUtils.dart';
import 'package:database/screens/shared_prefarence/shared_prefance_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.25),
      body: Center(
        child: Container(color: Colors.red, child: FlutterLogo()),
      ),
    );
  }

  void _whereToGo() async {
    final sharepref = await SharedPreferences.getInstance();

    final isLogin = sharepref.getBool(LoginKey);
    print(isLogin);
    Future.delayed(Duration(seconds: 3), () {
      if (isLogin != null)
      {
        if (isLogin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SharedPrefanceHomeScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      }
      else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }
}
