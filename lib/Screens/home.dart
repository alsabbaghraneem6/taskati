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
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: TaskSearchDelegate(myTaskBox: myTaskBox, doneBox: doneBox),
              );
            },
          ),
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
              return TaskCard(
                taskData: taskData,
                index: index,
                myTaskBox: box,
                doneBox: doneBox,
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

class TaskSearchDelegate extends SearchDelegate {
  final Box myTaskBox;
  final Box doneBox;

  TaskSearchDelegate({required this.myTaskBox, required this.doneBox});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildSearchResults();

  @override
  Widget buildSuggestions(BuildContext context) => _buildSearchResults();

  Widget _buildSearchResults() {
    List<MapEntry<int, Map<String, dynamic>>> filteredTasks = [];

    for (int i = 0; i < myTaskBox.length; i++) {
      var item = Map<String, dynamic>.from(myTaskBox.getAt(i));
      String title = (item["task"] ?? "").toString().toLowerCase();
      String desc = (item["description"] ?? "").toString().toLowerCase();

      if (title.contains(query.toLowerCase()) || desc.contains(query.toLowerCase())) {
        filteredTasks.add(MapEntry(i, item));
      }
    }

    if (filteredTasks.isEmpty) {
      return const Center(child: Text("No matching tasks found."));
    }

    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, i) {
        int originalIndex = filteredTasks[i].key;
        var taskData = filteredTasks[i].value;

        return TaskCard(
          taskData: taskData,
          index: originalIndex,
          myTaskBox: myTaskBox,
          doneBox: doneBox,
        );
      },
    );
  }
}

class TaskCard extends StatelessWidget {
  final Map<String, dynamic> taskData;
  final int index;
  final Box myTaskBox;
  final Box doneBox;

  const TaskCard({
    super.key,
    required this.taskData,
    required this.index,
    required this.myTaskBox,
    required this.doneBox,
  });

  @override
  Widget build(BuildContext context) {
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
              await myTaskBox.deleteAt(index);
            }
          },
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () => myTaskBox.deleteAt(index),
            ),
          ],
        ),
      ),
    );
  }
}