import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepg.dart';

void main() {
  runApp(MaterialApp(
    home: Registrationpg(),
    debugShowCheckedModeBanner: false,
  ));
}

class Registrationpg extends StatefulWidget {
  const Registrationpg({super.key});

  @override
  State<Registrationpg> createState() => _RegistrationpgState();
}

class _RegistrationpgState extends State<Registrationpg> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  late SharedPreferences data;
  TextEditingController name_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.yellow[30],
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 80),
                  child: Text(
                    "Registration",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextField(
                    controller: username_controller,
                    decoration: InputDecoration(
                        prefix: Icon(Icons.person),
                        hintText: "Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    controller: name_controller,
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.email_rounded),
                    ),
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains('@gmail') ||
                          !email.contains('.com')) {
                        return "Enter valid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    controller: password_controller,
                    obscureText: showpass,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(showpass == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showpass = !showpass;
                          });
                        },
                      ),
                    ),
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return "Enter valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    controller: confirm_password_controller,
                    obscureText: showpass,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(showpass == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showpass = !showpass;
                          });
                        },
                      ),
                    ),
                    validator: (confirmPassword) {
                      if (confirmPassword != password_controller.text) {
                        return "Passwords do not match";
                      } else if (confirmPassword!.isEmpty ||
                          confirmPassword.length < 6) {
                        return "Enter valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        register();
                      }
                    },
                    child: Text(
                      "  Register  ",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    data = await SharedPreferences.getInstance();
    String name = name_controller.text;
    String username = username_controller.text;
    String password = password_controller.text;

    if (username != '' && password != '') {
      data.setString("name", name);
      data.setString("username", username);
      data.setString("password", password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homescreeneg()));
    }
  }
}
