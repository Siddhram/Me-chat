import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mechat/mmodules/individualmessstructure.dart';
import 'package:mechat/pages/auth.dart';

class Messagedatabase {
  Future<void> sendmessage(String reciveremail, String message) async {
    Timestamp timestamp = Timestamp.now();
    Strcturemessage newmessage = Strcturemessage(
        currentuser: mainemail,
        reciver: reciveremail,
        message: message,
        timestamp: timestamp);
    List<String> ids = [mainemail.toString(), reciveremail];
    ids.sort();
    String? chatroomId = ids.join('_');
    await FirebaseFirestore.instance
        .collection("chat_rooms")
        .doc(chatroomId)
        .collection('messages')
        .add(newmessage.messagemap());
  }

  Stream<QuerySnapshot> getmessages(String reciveremail) {
    List<String> ids = [mainemail.toString(), reciveremail];
    ids.sort();
    String? chatroomId = ids.join('_');

    return FirebaseFirestore.instance
        .collection("chat_rooms")
        .doc(chatroomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
