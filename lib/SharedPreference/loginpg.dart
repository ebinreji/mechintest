import 'package:flutter/material.dart';
import 'package:mechinetest/SharedPreference/registerpg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepg.dart';

void main() {
  runApp(MaterialApp(home: Loginpage1(),
      debugShowCheckedModeBanner: false));
}

class Loginpage1 extends StatefulWidget {
  const Loginpage1({super.key});

  @override
  State<Loginpage1> createState() => _Loginpage1State();
}

class _Loginpage1State extends State<Loginpage1> {
  late SharedPreferences data;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late bool newuser;
  late String regname;
  late String regusername;
  late String regpassword;

  bool showPassword = false; // For toggling password visibility
  String errorMessage = ''; // To display error messages

  @override
  void initState() {
    super.initState();
    checkLogin();
    getuser();
  }

  void getuser() async {
    data = await SharedPreferences.getInstance();
    regname = data.getString('name') ?? '';
    regusername = data.getString('username') ?? '';
    regpassword = data.getString('password') ?? '';
  }

  void checkLogin() async {
    data = await SharedPreferences.getInstance();
    newuser = (data.getBool('new_user') ?? true);
    if (!newuser) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homescreeneg()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Page",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (errorMessage.isNotEmpty) // Display error message if any
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  String user = username.text;
                  String pass = password.text;

                  if (user.isNotEmpty && pass.isNotEmpty) {
                    if (user == regusername && pass == regpassword) {
                      print("Login successful");
                      data.setBool('new_user', false);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homescreeneg()));
                    } else {
                      setState(() {
                        errorMessage = "Invalid username or password";
                      });
                    }
                  } else {
                    setState(() {
                      errorMessage = "Please fill in all fields";
                    });
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registrationpg()));
                  },
                  child: Text(
                    "Create an account!",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
