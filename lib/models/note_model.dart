import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String id;
  String title;
  String details;
  Timestamp createdAt;
  NoteModel({this.title, this.details, this.id, this.createdAt});
  NoteModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    title = documentSnapshot.data()["title"];
    details = documentSnapshot.data()["details"];
    createdAt = documentSnapshot.data()["createdAt"];
  }
}
