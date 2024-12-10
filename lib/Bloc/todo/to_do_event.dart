part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class AddToDoEvents extends ToDoEvent{

  final String task;
  const AddToDoEvents({required this.task });

  @override
  List<Object> get props => [task];
}


class RemoveToDoEvents extends ToDoEvent{
  final Object task;
  const RemoveToDoEvents({required this.task });

  @override
  List<Object> get props => [task];
}
