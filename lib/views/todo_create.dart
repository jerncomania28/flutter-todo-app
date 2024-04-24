import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/viewModels/todo_view_model.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  Future<void> _selectDate(
      BuildContext context, Function(String) onChanged) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      onChanged(picked.toString().substring(0, 10));
    }
  }

  @override
  Widget build(context) {
    final todoViewModel = context.watch<TodoViewModel>();

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    children: [
                      Text(
                        'Create a new task',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: todoViewModel.taskName,
                    cursorColor: Colors.grey[600],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 81, 23, 90)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      labelText: 'Task name',
                      hintText: 'Enter task name',
                    ),
                    onChanged: (String newTaskName) {
                      todoViewModel.updateTaskName(newTaskName);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller:
                        TextEditingController(text: todoViewModel.taskDate),
                    readOnly: true,
                    cursorColor: Colors.grey[600],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 81, 23, 90)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      labelText: 'Select Date',
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 25,
                      ),
                      hintText: 'Select Date',
                    ),
                    onTap: () => _selectDate(context, (String newDate) {
                      todoViewModel.updateTaskDate(newDate);
                    }),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: todoViewModel.taskPriority,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 81, 23, 90)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      labelText: 'Select Priority',
                    ),
                    items:
                        <String>['High', 'Medium', 'Low'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newPriority) {
                      todoViewModel.updateTaskPriority(newPriority!);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 320),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 81, 23, 90),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        todoViewModel.createNewTask();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Create',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
