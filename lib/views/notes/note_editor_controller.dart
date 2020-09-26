import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_note/models/note_model.dart';
import 'package:firestore_note/services/dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    autoFill();
  }

  final NoteModel noteModel;

  NoteController(this.noteModel);

  static NoteController get to => Get.find();
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  FocusNode titleNode = FocusNode();
  FocusNode detailsNode = FocusNode();
  RxBool _isEdit = false.obs;
  bool get isEdit => _isEdit.value;

  autoFill() {
    if (noteModel != null) {
      title.text = noteModel.title;
      details.text = noteModel.details;
      _isEdit.value = true;
      update();
    }
  }

  addNote() {
    if (title.text.isNotEmpty) {
      if (isEdit) {
        DAO().updateNote(NoteModel(
            id: noteModel.id,
            title: title.text,
            details: details.text,
            createdAt: Timestamp.now()));
      } else {
        DAO().addNote(title.text, details.text);
      }
    } else {
      Get.snackbar("Failed", "Please add a title");
    }
  }
}
