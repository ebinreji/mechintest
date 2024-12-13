import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpg.dart';

class Homescreeneg extends StatefulWidget {
  const Homescreeneg({super.key});

  @override
  State<Homescreeneg> createState() => _HomescreenegState();
}

class _HomescreenegState extends State<Homescreeneg> {
  late SharedPreferences data;
  String? userName;

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      userName =
          data.getString("username") ?? "User"; // Changed "uname" to "username"
      print(userName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, $userName!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                data.setBool('new_user', true); // Mark user as new (logged out)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Loginpage1()),
                );
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
