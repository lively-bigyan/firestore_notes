import 'package:firestore_note/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard({Key key, this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.grey[200], blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${note.title}",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                  fontSize: 18)),
          Text("${note.details}", style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
