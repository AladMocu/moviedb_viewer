import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviedb_viewer/presentation/home/home_bindings.dart';
import 'package:moviedb_viewer/routers/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MovieDB Viewer',
      getPages: Pages.routes,
      initialRoute: Pages.home,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xFFf0ffff),
        focusColor: const Color(0xFFfffff4),
        highlightColor: Colors.orange.shade300, 
        textTheme: GoogleFonts.openSansTextTheme().copyWith(
          bodyLarge: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
        ),
        )
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        focusColor: const Color(0xFF5CA0D3),
        backgroundColor: const Color(0xff2C3848),
        highlightColor: Colors.yellow ,
        textTheme: GoogleFonts.openSansTextTheme().copyWith(
          bodyLarge: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
        ),
        )
      ),
      initialBinding: HomeBinding(),
      
    );

  }
}