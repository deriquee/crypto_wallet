

import 'package:flutter/material.dart';
import 'package:crypto_firebase/net/firebase_comp.dart';
import 'home_page.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.greenAccent
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Container(
          width: MediaQuery.of(context).size.width/1.3
          ,child:
          TextFormField(
            style: TextStyle(color: Colors.black),
            controller: username,
            decoration: InputDecoration(
              hintText: 'username@example.com',
              labelStyle: TextStyle(color: Colors.black),
              labelText: 'Email',
              hintStyle: TextStyle(color: Colors.blueAccent)
            ),
            
          ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
          width: MediaQuery.of(context).size.width/1.3,child:TextFormField(
            style: TextStyle(color: Colors.black),
            controller: password,
            obscureText: true,
            decoration:InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Use atleast six char',
              hintStyle: TextStyle(color: Colors.blueAccent)
            ) ,
          ),),
          SizedBox(
            height: 15.0),
          Container(
            width: MediaQuery.of(context).size.width/1.4,
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(16.0),topRight:Radius.circular(16.0) ),
              color: Colors.white,

              
            ),
            child: MaterialButton(onPressed: ()async{
              bool isTrue = await signIn(username.text, password.text);
              if (isTrue == true){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              }
            },
            child: Text('Login'),),
          ),
          SizedBox(
            height: 15.0),
          Container(width: MediaQuery.of(context).size.width/1.4,
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16.0),bottomRight:Radius.circular(16.0) ),
              color: Colors.white,

              
            ),
            child: MaterialButton(onPressed: ()async{
              bool isTrue =await register(username.text, password.text);
              if (isTrue == true){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              }
            },
            child: Text('Register'),),)
        ],)

      ),
      
    );
  }
}