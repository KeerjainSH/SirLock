import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB {
  final CollectionReference cmdCol =
      FirebaseFirestore.instance.collection('commands');

  FirestoreDB();

  Future updateCommand(int cmd) async {
    cmdCol.doc('0Ufqy1OUZ4QUadL1hmkl').update({
      'command': cmd,
    });
  }
}
