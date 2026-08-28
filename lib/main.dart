import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_app/Screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('myTask');
  await Hive.openBox('doneTask');
  await Hive.openBox('settings');

  runApp(const MyApp());
}

Future<void> requestImagePermission() async {
  if (await Permission.photos.isDenied) {
    await Permission.photos.request();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsBox = Hive.box('settings');

    // الاستماع لتغييرات الثيم تلقائياً
    return ValueListenableBuilder(
      valueListenable: settingsBox.listenable(keys: ['isDark']),
      builder: (context, Box box, _) {
        bool isDark = box.get('isDark', defaultValue: true);

        return MaterialApp(
          title: 'Taskatii',
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Colors.grey[100],
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.deepPurpleAccent,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const Home(),
        );
      },
    );
  }
}