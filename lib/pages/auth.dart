import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_string/random_string.dart';

String? mainemail;

class Authservice {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? _user;

  Future<bool> Sinup(String Email, String Password) async {
    try {
      var res = await firebaseAuth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      _user = res.user;
      mainemail = Email.toString();
      return true;
      //  _user.uid;
      // return null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> Login(String Email, String Password) async {
    try {
      var response = await firebaseAuth.signInWithEmailAndPassword(
          email: Email, password: Password);
      // return null;
      mainemail = Email.toString();

      return true;
      // return "";
    } catch (e) {
      return false;
    }
  }

  Future<bool> createuser(String Firstname, String Lastname, String Email,
      String phoneno, String userid) async {
    try {
      var res = await FirebaseFirestore.instance
          .collection("Users")
          .doc(mainemail)
          .collection("contract")
          .doc(Email)
          .set({
        "Firstname": Firstname,
        "Lastname": Lastname,
        "Email": Email,
        "phoneno": phoneno
      });
      return true;
      // return "";
    } catch (e) {
      return false;
    }
  }

  Stream<List<String>> getContractDocumentEmails() async* {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(mainemail)
          .collection("contract")
          .get();

      final documentEmails = snapshot.docs.map((doc) => doc.id).toList();
      yield documentEmails;
    } catch (e) {
      print("Error fetching document emails: $e");
      yield [];
    }
  }

  Stream<List<String>> getContractDocumentNames() {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(mainemail)
        .collection("contract")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }
}
