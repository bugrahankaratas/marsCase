import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mars_case/service/model/user_model.dart';

class Service {
  static Service? _instance;
  static Service get instance {
    return _instance ??= Service();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("User");

  String userId() => _auth.currentUser?.uid ?? '';

  Future<List<Notes>?> fetchNoteList() async {
    final userRef = collectionReference.doc(userId());
    var userData = await userRef.get(); // fetching user data

    var noteList = UserModel.fromJson(userData.data() as Map<String, dynamic>).notes;

    return noteList;
  }

  Future<void> addDocument(String title, String document) async {
    var noteList = await fetchNoteList();

    var note = Notes(content: document, date: DateTime.now().toString(), title: title);

    noteList?.isNotEmpty ?? false ? noteList?.add(note) : noteList = [note];

    await updateNotes(noteList);
  }

  Future<void> updateDocument(int index, String title, String document) async {
    final noteList = await fetchNoteList();
    var note = Notes(content: document, date: DateTime.now().toString(), title: title);

    noteList?.removeAt(index);
    noteList?.insert(index, note);
    await updateNotes(noteList);
  }

  Future<void> updateNotes(List<Notes>? noteList) async {
    List<Map<String, dynamic>> tempNotes = [];

    noteList?.forEach((element) {
      tempNotes.add({
        'title': element.title,
        'content': element.content,
        'date': element.date,
      });
    });
    await collectionReference.doc(userId()).update({'notes': tempNotes});
  }
}
