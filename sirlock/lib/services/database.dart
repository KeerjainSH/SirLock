import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  // final String uid;

  Database();

  final CollectionReference cmdCol =
      FirebaseFirestore.instance.collection('commands');

  Future updateCommand(int cmd) async {
    cmdCol.doc('0Ufqy1OUZ4QUadL1hmkl').update({
      'command': cmd,
    });
  }
}
