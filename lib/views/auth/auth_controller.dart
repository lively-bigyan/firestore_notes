import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_note/views/auth/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  AuthService _authService;
  AuthController() {
    _authService = AuthService();
  }
  Rx<User> user = Rx<User>();
  String get uid => user.value.uid;
  @override
  void onReady() {
    super.onReady();
    ever(user, handleAuthChanged);
    user.value = _authService.getCurrentUser();
    user.bindStream(_authService.onAuthChanged());
    super.onInit();
  }

  handleAuthChanged(user) async {
    if (user == null) {
      Get.offAllNamed("/login");
    } else {
      Get.offAllNamed("/notes");
    }
  }

  handleGoogleSignIn() async {
    await _authService.signInWithGoogle();
  }
}
