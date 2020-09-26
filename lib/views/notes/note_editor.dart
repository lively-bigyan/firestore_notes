import 'package:firestore_note/models/note_model.dart';
import 'package:firestore_note/views/notes/note_editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class NoteEditor extends StatelessWidget {
  final NoteModel noteModel;

  const NoteEditor({Key key, this.noteModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(NoteController.to.isEdit ? "Edit Note" : "Add a Note"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
        onPressed: () {
          Get.focusScope.unfocus();
          NoteController.to.addNote();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<NoteController>(
          init: NoteController(noteModel),
          builder: (ctrl) {
            return ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey[400],
                            offset: Offset(0, -2))
                      ]),
                  child: TextFormField(
                    controller: ctrl.title,
                    style: TextStyle(fontSize: 20),
                    focusNode: ctrl.titleNode,
                    decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Container(
                  height: Get.height / 1.5,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey[300],
                            offset: Offset(0, 2))
                      ]),
                  child: TextFormField(
                    controller: ctrl.details,
                    focusNode: ctrl.detailsNode,
                    style: TextStyle(fontSize: 16),
                    maxLines: 20,
                    minLines: 5,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        hintText: "Details",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                )
              ],
            );
          }),
    );
  }
}
