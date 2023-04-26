import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);



  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  TextEditingController email_Controller = TextEditingController();
  TextEditingController password_Controller = TextEditingController();



Future adduser()async{

  CollectionReference users = await FirebaseFirestore.instance.collection('users');
  users.add(({
    'mail' : email_Controller.text
  }))
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                 Padding(
                  padding: EdgeInsets.all(15),
                   child: TextField(

                    controller: email_Controller,
                     decoration: InputDecoration(
                     border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Sign In'),
                  onPressed: (){
                    adduser();
                    // var mail = email_Controller.text;
                    // if(mail!= ""){
                    //
                    //   try{
                    //     print("dhukse");
                    //     FirebaseFirestore.instance.collection('new').doc().set(
                    //         {
                    //           'mail' : mname.toString()
                    //         });
                    //
                    //   }catch(e){
                    //     print("Error $e");
                    //   }
                    // }
                  },
                )
              ],
            )
        )


    );
  }

  // void initState() {
  // adduser();
  // // TODO: implement initState
  //   super.initState();
  // }
}
