import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mechat/pages/auth.dart';
import 'package:mechat/pages/create_contec.dart';
import 'package:mechat/pages/frindscreation.dart';

class LoginP extends StatefulWidget {
  const LoginP({Key? key}) : super(key: key);

  @override
  State<LoginP> createState() => _LoginState();
}

class _LoginState extends State<LoginP> {
  final TextEditingController _emailControllerlogin = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final TextEditingController _emailControllersinin = TextEditingController();
  final TextEditingController _passwordControllerlogin =
      TextEditingController();
  final TextEditingController _passwordControllersinin =
      TextEditingController();
  bool error = false;
  bool errorlogin = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  bool val = false;
  // Widget buttonui(String text, Function ontap) {
  //   return ElevatedButton(
  //       onPressed: ontap,
  //       child: Text(
  //         text,
  //         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
  //       ));
  // }

  Widget build_ui_sinin() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
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
              "Create yoyur acoount feel th world!",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    child: Form(
                        child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                          hintText: "Firstname", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (error) {
                          return 'Please enter an valid info';
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
                        } else if (error) {
                          return 'Please enter an valid info';
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
                      controller: _emailControllersinin,
                      decoration: InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (error) {
                          return 'Please enter an valid info';
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
                    child: Form(
                        child: TextFormField(
                      controller: _passwordControllersinin,
                      decoration: InputDecoration(
                          hintText: "password", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (error) {
                          return 'Please enter an valid info';
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
                    child: Form(
                        child: TextFormField(
                      controller: _phoneNoController,
                      decoration: InputDecoration(
                          hintText: "Number", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (error) {
                          return 'Please enter an valid info';
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
                  if (_formKey.currentState?.validate() ?? false) {
                    bool res = await Authservice().Sinup(
                        _emailControllersinin.text.trim(),
                        _passwordControllersinin.text.trim());

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Createcontract(
                                currentuseremail:
                                    _emailControllersinin.text.trim(),
                              )),
                    );
                    if (res == false) {
                      setState(() {
                        error = true;
                      });
                    }
                  }
                },
                child: Text(
                  "Sinin",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
            // buttonui("Sinin", ),
            GestureDetector(
              onTap: () {
                setState(() {
                  val = !val;
                });
              },
              child: Text(
                " have an account, Login",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build_ui() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
      child: Form(
        key: _formKey2,
        child: Column(
          children: [
            header(),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              child: TextFormField(
                controller: _emailControllerlogin,
                decoration: InputDecoration(
                    hintText: "Email", border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (errorlogin) {
                    return 'Please enter an valid info';
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
                controller: _passwordControllerlogin,
                decoration: InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (errorlogin) {
                    return 'Please enter an valid info';
                  }
                  return null;
                },
              )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey2.currentState?.validate() ?? false) {
                    var mess = await Authservice().Login(
                        _emailControllerlogin.text.trim(),
                        _passwordControllerlogin.text.trim());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Frindscreation()),
                    );
                    if (mess == false) {
                      setState(() {
                        errorlogin = true;
                      });
                    }
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
            // buttonui("Login",),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  val = !val;
                });
              },
              child: Text(
                "Dont have an account, Sinin",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
            // build_ui("",),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hey Wellcome!",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          "Hey yore been Missed!",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: val ? build_ui() : build_ui_sinin(),
    );
  }
}
