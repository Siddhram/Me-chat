// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:mechat/pages/auth.dart';
import 'package:mechat/pages/frindscreation.dart';
import 'package:mechat/pages/twousers.dart';

class Createcontract extends StatefulWidget {
  String? currentuseremail;

  Createcontract({
    Key? key,
    this.currentuseremail,
  }) : super(key: key);
  
  @override
  State<Createcontract> createState() => _CreatecontractState();
}

class _CreatecontractState extends State<Createcontract> {
 
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
// Stream stream=;
    String formattedTime = now.toIso8601String().split('T')[1].split('.')[0];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Chat"),
            ],
          ),
        ),
        body: StreamBuilder<List<String>>(
            stream: Authservice().getContractDocumentEmails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No contracts found."));
              } else {
                final documents = snapshot.data!;
                DateTime now = DateTime.now();
                String formattedTime = DateFormat('h:mm a').format(now);
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 8.0),
                      child: Card(
                        color: Colors.amber[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1715313676060-43e777f5ed48?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0OHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                          ),
                          title: GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Twousers(
                                        useremail: mainemail,
                                        friendemail: document.substring(
                                            0, document.length))),
                              );
                            }),
                            child: Text(
                              "${document.substring(0, document.length)}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Text("${formattedTime}"),
                        ),
                      ),
                    );
                  },
                );
              }

              // child:}
            }),
        bottomNavigationBar: Row(
          children: [
            IconButton(
              icon: Icon(Icons.info), // Replace with your desired icon
              onPressed: () {
                // Define the onTap function here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Frindscreation()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
