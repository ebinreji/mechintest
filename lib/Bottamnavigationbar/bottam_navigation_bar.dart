import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: BottamNavigationBar(),debugShowCheckedModeBanner: false,));
}
class BottamNavigationBar extends StatefulWidget {
  const BottamNavigationBar({super.key});

  @override
  State<BottamNavigationBar> createState() => _BottamNavigationBarState();
}

class _BottamNavigationBarState extends State<BottamNavigationBar> {
  int index=0;
  var screen=[
    Text("Profile"),
    Text("Chat"),
    Text("Call"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("Bottam Navigation bar"),
),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (tapindex){
            setState(() {
              index=tapindex;
            });
          },
          selectedItemColor:Colors.white,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,


          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person,),label: "profile",backgroundColor: Colors.blue),
            BottomNavigationBarItem(icon: Icon(Icons.message,),label: "Chat",backgroundColor: Colors.blue),
            BottomNavigationBarItem(icon: Icon(Icons.phone,),label: "Call",backgroundColor: Colors.blue),
          ]),
      body: Center(child: screen[index],),
    );
  }
}
