import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  var doneBox = Hive.box("doneTask");
  var myTaskBox = Hive.box("myTask");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: const Text("Done Tasks"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: doneBox.listenable(),
        builder: (context, Box box, _) {
          if (box.isEmpty) {
            return const Center(child: Text("No completed tasks yet!"));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (BuildContext context, int index) {
              var item = Map<String, dynamic>.from(box.getAt(index));
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(item["task"] ?? ""),
                  subtitle: Text(item["description"] ?? ""),
                  leading: Checkbox(
                    value: item["isDone"] ?? true,
                    onChanged: (value) async {
                      if (value == false) {
                        item["isDone"] = false;
                        await myTaskBox.add(item);
                        await box.deleteAt(index);
                      }
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => box.deleteAt(index),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}