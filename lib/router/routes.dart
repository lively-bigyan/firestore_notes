import 'package:firestore_note/views/auth/auth_view.dart';
import 'package:firestore_note/views/notes/notes_view.dart';
import 'package:firestore_note/views/init_screen.dart';
import 'package:get/route_manager.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => InitScreen(),
    ),
    GetPage(name: '/login', page: () => AuthView()),
    GetPage(
      name: '/notes',
      page: () => ViewNotes(),
    ),
  ];
}
