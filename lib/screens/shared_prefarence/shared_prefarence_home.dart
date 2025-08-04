import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefarenceHome extends StatefulWidget {
  const SharedPrefarenceHome({super.key});

  @override
  State<SharedPrefarenceHome> createState() => _SharedPrefarenceHomeState();
}

class _SharedPrefarenceHomeState extends State<SharedPrefarenceHome> {
  final nameController = TextEditingController();
  String? getName;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final spf = await SharedPreferences.getInstance();
              spf.setString('name', nameController.text);

              setState(() {});
            },
            child: Text('save'),
          ),
          Text(getName ?? 'no data'),
        ],
      ),
    );
  }

  void getData() async {
    final spf = await SharedPreferences.getInstance();
    getName = spf.getString('name').toString();
  }
}
