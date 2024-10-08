// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Strcturemessage {
  String? currentuser;
  String? reciver;
  String? message;
  Timestamp? timestamp;
  Strcturemessage({
    this.currentuser,
    this.reciver,
    this.message,
    this.timestamp,
  });
  Map<String,dynamic> messagemap(){
    return {
      'currentuser':currentuser,
      'reciver':reciver,
      'message':message,
      'timestamp':timestamp
    };
  }
}
