import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String title;
  String doc;

  Todo({required this.id, required this.title, required this.doc});

  factory Todo.fromSnapshot(DocumentSnapshot snapshot) {
    return Todo(
      id: snapshot.id,
      title: snapshot["title"],
      doc: snapshot["doc"],
    );
  }
}
