import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_app/Screens/home.dart';

//void main() async {
// WidgetsFlutterBinding.ensureInitialized();
// await Hive.initFlutter();
//if (!Hive.isBoxOpen('myTask')) {
// await Hive.openBox('myTask');
//}
//if (!Hive.isBoxOpen('doneTask')) {
// await Hive.openBox('doneTask');
//}
//await requestImagePermission();
//runApp(const MyApp());
//}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('myTask');
  await Hive.openBox('doneTask');

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
    return MaterialApp(
      title: 'Taskatii',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

