import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_note/router/routes.dart';
import 'package:firestore_note/views/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff1565C0),
  ));
  Get.put(AuthController(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xff1565C0),
          primaryTextTheme: GoogleFonts.openSansTextTheme()
              .apply(displayColor: Colors.white, bodyColor: Colors.white),
          accentTextTheme: GoogleFonts.openSansTextTheme(),
          textTheme: GoogleFonts.quicksandTextTheme(),
        ),
        getPages: Routes.routes,
        initialRoute: "/",
      ),
    );
  }
}
