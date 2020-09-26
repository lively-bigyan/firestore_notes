import 'package:firestore_note/models/note_model.dart';
import 'package:firestore_note/services/dao.dart';
import 'package:get/get.dart';

class NoteViewController extends GetxController {
  static NoteViewController get to => Get.find();
  Rx<List<NoteModel>> _notes = Rx<List<NoteModel>>();
  List<NoteModel> get notes => _notes.value ?? List<NoteModel>();
  @override
  void onInit() {
    super.onInit();
    _notes.bindStream(DAO().getNotes());
  }

  deleteNote(id) {
    DAO().deleteNote(id);
  }
}
