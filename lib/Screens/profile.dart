import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? imagePath;
  final settingsBox = Hive.box('settings');

  @override
  void initState() {
    super.initState();
     imagePath = settingsBox.get('profileImage');
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });

      await settingsBox.put('profileImage', pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.deepPurpleAccent,
                backgroundImage: (imagePath != null && File(imagePath!).existsSync())
                    ? FileImage(File(imagePath!))
                    : null,
                child: (imagePath == null || !File(imagePath!).existsSync())
                    ? const Icon(Icons.camera_alt, size: 40, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Tap image to upload photo",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),

            ValueListenableBuilder(
              valueListenable: settingsBox.listenable(keys: ['isDark']),
              builder: (context, Box box, _) {
                bool isDark = box.get('isDark', defaultValue: true);
                return SwitchListTile(
                  title: const Text(
                    "Dark Mode",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  secondary: Icon(
                    isDark ? Icons.dark_mode : Icons.light_mode,
                    color: Colors.deepPurpleAccent,
                  ),
                  value: isDark,
                  onChanged: (val) {
                    settingsBox.put('isDark', val);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}