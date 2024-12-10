part of 'to_do_bloc.dart';

final class ToDoState extends Equatable {
  final List<String> todoList;

  const ToDoState({
    this.todoList = const []
  });

  ToDoState copyWith({List<String>? todoList}){
return ToDoState(todoList:  todoList ?? this.todoList);
}

  @override
  List<Object> get props => [todoList];
}
