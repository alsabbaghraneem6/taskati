import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'add_task.dart';
import 'done_tasks.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myTaskBox = Hive.box("myTask");
  var doneBox = Hive.box("doneTask");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: const Text("My Tasks"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DoneTasks()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: myTaskBox.listenable(),
        builder: (context, Box box, _) {
          if (box.isEmpty) {
            return const Center(child: Text("No tasks available!"));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              var taskData = Map<String, dynamic>.from(box.getAt(index));
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    taskData["task"] ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(taskData["description"] ?? ""),
                      if (taskData["date"] != null)
                        Text(
                          "Date: ${taskData["date"]}",
                          style: const TextStyle(fontSize: 12, color: Colors.deepPurpleAccent),
                        ),
                    ],
                  ),
                  leading: Checkbox(
                    value: taskData["isDone"] ?? false,
                    onChanged: (value) async {
                      if (value == true) {
                        taskData["isDone"] = true;
                        await doneBox.add(taskData);
                        await box.deleteAt(index);
                      }
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit Task
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blueAccent),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddTask(
                                taskData: taskData,
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                      // Delete Task
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => box.deleteAt(index),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTask()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}