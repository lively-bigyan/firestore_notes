import 'package:firestore_note/models/note_model.dart';
import 'package:firestore_note/shared/custom_fab.dart';
import 'package:firestore_note/views/auth/auth_service.dart';
import 'package:firestore_note/views/notes/note_editor.dart';
import 'package:firestore_note/views/notes/note_view_controller.dart';
import 'package:firestore_note/views/notes/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewNotes extends StatelessWidget {
  final noteController = Get.put(NoteViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Firestore Notes"),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {
                AuthService().signOut();
              },
              child: Text("Logout",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)))
        ],
      ),
      floatingActionButton: CustomFAB(
        page: NoteEditor(),
      ),
      body: GetX<NoteViewController>(
        builder: (ctrl) {
          if (ctrl != null && ctrl.notes != null) {
            return ListView.separated(
                padding: EdgeInsets.all(10),
                separatorBuilder: (context, i) => const SizedBox(height: 10),
                itemCount: ctrl.notes.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                      onTap: () => _buildBottomSheet(ctrl.notes[i]),
                      child: NoteCard(note: ctrl.notes[i]));
                });
          } else if (ctrl.notes.length == 0) {
            return Center(
              child: Text("No notes added yet.",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.grey)),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  _buildBottomSheet(NoteModel note) {
    return Get.bottomSheet(Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.white70),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4))),
            child: Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.mode_edit),
                    title: Text("Edit"),
                    onTap: () {
                      Get.back();
                      Get.to(NoteEditor(noteModel: note));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete_sweep, color: Colors.red),
                    title: Text("Delete"),
                    onTap: () {
                      noteController.deleteNote(note.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
