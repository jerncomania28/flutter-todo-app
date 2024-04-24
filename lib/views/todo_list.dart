import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/viewModels/todo_view_model.dart';
import 'package:todo_app/widgets/custom_drop_down.dart';
import 'package:todo_app/widgets/custom_select_date.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Map<String, Color> priorityColors = {
    'High': const Color.fromARGB(255, 255, 0, 0),
    'Medium': const Color.fromARGB(255, 255, 165, 0),
    'Low': const Color.fromARGB(255, 0, 128, 0),
  };

  @override
  Widget build(BuildContext context) {
    final todoViewModel = context.watch<TodoViewModel>();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 81, 23, 90),
        onPressed: () {
          Navigator.pushNamed(context, '/create-todo');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Morning !',
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      todoViewModel.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.perm_identity_rounded),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    CustomDropDown(
                      selectedValue: todoViewModel.filterStatus,
                      items: const ['All', 'High', 'Medium', 'Low'],
                      onChanged: (String? value) {
                        todoViewModel.updateFilterStatus(value!);
                      },
                    ),
                    const SizedBox(width: 10),
                    CustomSelectDate(
                      hint: 'Filter by Date',
                      onChanged: (String value) {
                        todoViewModel.updateFilterDate(value);
                      },
                      selectedDate: todoViewModel.filterDate ?? 'Filter Date',
                    ),
                    IconButton(
                      onPressed: () {
                        todoViewModel.clearFilters();
                      },
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        size: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     TextButton(
            //       onPressed: () {},
            //       child: const Text('Todo'),
            //     ),
            //     TextButton(
            //       onPressed: () {},
            //       child: const Text('Completed'),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 5),
            Expanded(
              child: todoViewModel.filteredTasks.isEmpty
                  ? Image.asset(
                      'assets/icons/no-task.png',
                    )
                  : ListView.builder(
                      itemCount: todoViewModel.filteredTasks.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                    todoViewModel.filteredTasks[index].name!),
                              ),
                              subtitle: Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 16,
                                        color: Colors.grey[400],
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        todoViewModel
                                            .filteredTasks[index].date!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600]),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.label,
                                        size: 16,
                                        color: priorityColors[todoViewModel
                                            .filteredTasks[index].priority!]!,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        todoViewModel
                                            .filteredTasks[index].priority!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/edit-todo',
                                    arguments: {
                                      'task':
                                          todoViewModel.filteredTasks[index],
                                    },
                                  );
                                },
                                icon: const Icon(Icons.edit_note),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
