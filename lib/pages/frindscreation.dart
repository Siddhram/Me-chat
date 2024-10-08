// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:mechat/pages/auth.dart';
import 'package:mechat/pages/create_contec.dart';

class Frindscreation extends StatefulWidget {
  String? currentuseremail;
  Frindscreation({
    Key? key,
    this.currentuseremail,
  }) : super(key: key);

  @override
  State<Frindscreation> createState() => _FrindscreationState();
}

class _FrindscreationState extends State<Frindscreation> {
  final _formKey3 = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print(widget.currentuseremail);
    // print("User created by user ${widget.currentuseremail}");
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Wellcome",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Create yoyur frinds",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Createcontract(
                                      currentuseremail: mainemail,
                                    )),
                          );
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey3,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            child: Form(
                                child: TextFormField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                  hintText: "Firstname",
                                  border: OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email';
                                }
                                return null;
                              },
                            )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 80,
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                hintText: "Lastname",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 80,
                            child: Form(
                                child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  border: OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email';
                                }
                                return null;
                              },
                            )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 80,
                            child: Form(
                                child: TextFormField(
                              controller: _phoneNoController,
                              decoration: InputDecoration(
                                  hintText: "Number",
                                  border: OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an email';
                                }
                                return null;
                              },
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          //  se a nullable type

                          // ; // Declare userId as nullable

                          // Use userId safely after the check

                          // Example usage (assuming userId is not null):
                          // Text("Welcome, $userid");
                          if (true) {
                            if (_formKey3.currentState?.validate() ?? false) {
                              var res = await Authservice().createuser(
                                  _firstNameController.text.trim(),
                                  _lastNameController.text.trim(),
                                  _emailController.text.trim(),
                                  _phoneNoController.text.trim(),
                                  widget.currentuseremail.toString());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Createcontract(
                                          currentuseremail: mainemail,
                                        )),
                              );
                              if (res == true) {
                                print(
                                    "User created by user ${widget.currentuseremail}");
                              }
                            }
                          }
                        },
                        child: Text(
                          "Create contract",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )),
                    // buttonui("Sinin", ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // val = !val;
                        });
                      },
                      child: Text(
                        " create frinds",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
