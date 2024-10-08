// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:mechat/pages/auth.dart';

import '../mmodules/messdatabase.dart';

class Twousers extends StatefulWidget {
  String? useremail;
  String? friendemail;

  Twousers({
    Key? key,
    this.useremail,
    this.friendemail,
  }) : super(key: key);

  @override
  State<Twousers> createState() => _TwousersState();
}

class _TwousersState extends State<Twousers> {
  Future<Map<String, dynamic>?> fetchdata() async {
    try {
      // Fetch the document snapshot
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(mainemail)
          .collection("contract")
          .doc(widget.friendemail)
          .get();

      // Check if the document exists
      if (docSnapshot.exists) {
        // Return the data as a map
        return docSnapshot.data() as Map<String, dynamic>?;
      } else {
        // Return null if the document does not exist
        return null;
      }
    } catch (e) {
      // Handle any errors that occur
      print("Error fetching data: $e");
      return null;
    }
  }

  final TextEditingController _text = TextEditingController();
  Messagedatabase messagedatabase = Messagedatabase();
  Widget messBox() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 3, color: Colors.black)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5.0,
              right: 0,
              top: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _text,
                    decoration: InputDecoration(
                      // borderRadius: BorderRadius.circular(20),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),

                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Enter your text...',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                IconButton(onPressed: sendmessage, icon: Icon(Icons.send)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendmessage() async {
    if (_text.text.isNotEmpty) {
      await messagedatabase.sendmessage(
          widget.friendemail.toString(), _text.text.toString());
      _text.clear();
    }
  }

  bool istyping = false;
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic>? userData = await fetchdata(mainemail, email);
    fetchdata().then((data) {
      if (data != null) {
        // Use the data retrieved
        print("Firstname: ${data['Firstname']}");
        print("Lastname: ${data['Lastname']}");
        print("Email: ${data['Email']}");
        print("phoneno: ${data['phoneno']}");
      } else {
        print("Document does not exist or an error occurred.");
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendemail.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: _buildmessagelist()),
          messBox(),
        ],
      ),

      // bottomNavigationBar: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(15.0),
      //       child: Container(
      //         height: 60,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20),
      //             border: Border.all(width: 3, color: Colors.black)),
      //         child: Center(
      //           child: TextField(
      //             // autofillHints,
      //             autofocus: false,
      //             controller: _text,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget _buildmessagelist() {
    return StreamBuilder<QuerySnapshot>(
        stream: messagedatabase.getmessages(widget.friendemail.toString()),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No contracts found."));
          } else {
            return ListView(
              children: snapshot.data!.docs
                  .map((doc) => _buildMessageitem(doc))
                  .toList(),
            );
          }
        }));
  }

  Widget _buildMessageitem(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    bool iscurrentuser = data['currentuser'] == mainemail.toString();
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment:
            iscurrentuser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            height: (data['message'].toString().length * 10.0) < 60
                ? 66
                : (data['message'].toString().length * 2.5),
            width: 150,
            // width: ,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 8.0,
              shadowColor: iscurrentuser ? Colors.black45 : Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: Text(
                            data['currentuser'].toString(),
                            style: TextStyle(
                              fontSize: 10,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Center(
                      child: Text(
                        data['message'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            _formatTimestamp(data['timestamp'].toString())
                                .toString(),
                            style: TextStyle(
                              fontSize: 10,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    try {
      // Parse the timestamp to a DateTime object
      DateTime dateTime = DateFormat("d MMMM yyyy 'at' HH:mm:ss 'UTC'XXX")
          .parse(timestamp, true);

      // Format the DateTime object to 12-hour format with AM/PM
      String formattedTime = DateFormat("h:mm:ss a").format(dateTime.toLocal());

      return formattedTime;
    } catch (e) {
      return 'Invalid date format';
    }
  }
}
