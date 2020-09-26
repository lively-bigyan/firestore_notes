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
          () => Text(NoteController.to.isEdit ? "Edit Note" : "Take Notes"),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
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
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blue[50],
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
                  height: 200,
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: TextFormField(
                    controller: ctrl.details,
                    focusNode: ctrl.detailsNode,
                    style: TextStyle(fontSize: 14),
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
