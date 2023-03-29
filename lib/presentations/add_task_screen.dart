import 'package:flutter/material.dart';
import 'package:todoey/constants/constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key, required this.addTask}) : super(key: key);
  final Function(String) addTask;

  @override
  Widget build(BuildContext context) {
    String taskTitle='';
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: kContainerBoxDeco(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              // decoration: InputDecoration(),
              onChanged: (val){
                taskTitle = val;
              },
              autofocus: true,
              textAlign: TextAlign.center,

            ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.lightBlueAccent)
              ),
              onPressed: (){
                if(taskTitle!=''){
                  addTask(taskTitle);
                  taskTitle='';
                }
                },
              child: const Text('ADD'),

            )
          ],
        ),
      ),
    );
  }
}





