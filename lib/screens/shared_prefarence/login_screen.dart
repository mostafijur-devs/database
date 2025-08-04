import 'package:database/screens/shared_prefarence/sharePrefarencUtils.dart';
import 'package:database/screens/shared_prefarence/shared_prefance_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    return Scaffold(
      body:  SafeArea(child:Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  disabledBorder: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () async{
                final sharepref = await SharedPreferences.getInstance();
                sharepref.setBool(LoginKey, true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SharedPrefanceHomeScreen(),));

              }, child: Text('login'))

            ],
          ),
        ),
      ) ),
    );
  }

  _loginButton(BuildContext context) async {

  }
}
