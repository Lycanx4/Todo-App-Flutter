import 'package:flutter/material.dart';
import 'package:todoey/constants/constants.dart';
import 'package:todoey/presentations/add_task_screen.dart';

import '../model/task.dart';
import '../widget/list_view_widget.dart';

List<Task> tasks = [
  Task(name: 'Buy milk'),
  Task(name: 'Buy bread'),
  Task(name: 'Buy egg'),

];


class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add,
        size: 30.0,),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder:
                  (BuildContext context) =>
                      SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddTaskScreen(
                            addTask: (val){
                              setState(() {
                                tasks.add(Task(name: val));
                                Navigator.pop(context);
                              });
                          },),
                      )
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 35.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Todey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: const TextStyle(
                    color: Colors.white,

                    fontSize: 18.0,
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: kContainerBoxDeco(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TaskListView(tasks: tasks,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}





// class TodoCheckBox extends StatelessWidget {
//   TodoCheckBox({
//     Key? key,
//     required this.title,
//     required this.isCheck,
//     this.onChanged
//   }) : super(key: key);
//
//   final ValueChanged<bool?>? onChanged;
//   final String title;
//   final bool isCheck;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title),
//         Checkbox(
//         value: isCheck,
//         onChanged: onChanged)
//       ],
//     );
//   }
// }
