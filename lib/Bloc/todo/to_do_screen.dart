import 'package:block_roadmap/Bloc/todo/to_do_bloc.dart';
import 'package:block_roadmap/Components/text300.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<ToDoBloc, ToDoState>(
            builder: (context, state) {
              if (state.todoList.isEmpty) {
                return const Center(
                    child: Text300(
                  text: 'No ToDo found',
                  fontSize: 16,
                ));
              } else  {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text300(
                            text: '${state.todoList[index].toString()}',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          trailing:  IconButton(
                           icon:  const Icon(Icons.delete),
                            color: Colors.black,
                            onPressed: (){
                              context.read<ToDoBloc>().add(RemoveToDoEvents(task: state.todoList[index]));
                            },

                          ),
                        );
                      }),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i = 0; i<12; i++){
            context.read<ToDoBloc>().add(AddToDoEvents(task: 'task: '+i.toString()));
          }

        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
