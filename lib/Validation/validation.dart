import 'package:flutter/material.dart';
import 'homepg.dart';
void main(){
  runApp(MaterialApp(home: Registration(),debugShowCheckedModeBanner: false,));
}
class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.yellow[30],
          child:Form(
            key: formkey,
            child: Column(children: [
              Padding(
                padding:const EdgeInsets.only(left: 50,top: 80),
                child: Text("Registration",
                  style: TextStyle(fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 70,right: 70),
                child: TextField(
                  decoration: InputDecoration(
                      prefix: Icon(Icons.person_add_alt_1),
                      hintText: "Name",
                      labelText: "Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30,left: 70,right: 70),
                child: TextFormField(
                  decoration: InputDecoration(

                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                    prefixIcon: Icon(Icons.person),),
                  validator: (email) {
                    if (email!.isEmpty ||
                        !email.contains('@gmail') ||
                        !email.contains('.com')) {
                      return "Enter valid Email";
                    }else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
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
                  validator: (password){
                    if(password!.isEmpty || password.length<6){
                      return "Enter valid password";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Conform Password",
                    labelText: "Conform Password",
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
                  validator: (password){
                    if(password!.isEmpty || password.length<6){
                      return "Enter valid password";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),
                  onPressed: (){
                    var valid=formkey.currentState!.validate();
                    if(valid){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));

                    }
                  },
                  child: Text("  Register  ")),
            ],
            ),
          )
      ),
    );
  }
}