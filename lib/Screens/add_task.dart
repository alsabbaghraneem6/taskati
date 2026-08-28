import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'custom_feild.dart';

class AddTask extends StatefulWidget {
  final Map? taskData;
  final int? index;

  const AddTask({super.key, this.taskData, this.index});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final varTaskBox = Hive.box("myTask");
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.taskData != null) {
      taskController.text = widget.taskData!["task"] ?? "";
      descriptionController.text = widget.taskData!["description"] ?? "";
      dateController.text = widget.taskData!["date"] ?? "";
    }
  }

  @override
  void dispose() {
    taskController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = widget.taskData != null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text(isEditing ? "Edit Task" : "Add Task"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              CustomFormField(
                controller: taskController,
                textValidate: 'title',
                hint: 'Enter task title',
              ),
              const SizedBox(height: 15),
              CustomFormField(
                controller: descriptionController,
                textValidate: "description",
                hint: "Enter task subtitle / description",
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: selectDate,
                validator: (value) => value == null || value.isEmpty ? "Select date" : null,
                decoration: InputDecoration(
                  hintText: 'Select Task Date',
                  suffixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var data = {
                      "task": taskController.text.trim(),
                      "description": descriptionController.text.trim(),
                      "date": dateController.text.trim(),
                      "isDone": false,
                    };

                    if (isEditing) {
                      // Edit Task
                      varTaskBox.putAt(widget.index!, data);
                    } else {
                      // Add Task
                      varTaskBox.add(data);
                    }
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 45),
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text(isEditing ? "Update Task" : "Add Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}