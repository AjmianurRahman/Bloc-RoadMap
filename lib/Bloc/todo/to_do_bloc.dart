import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';

part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {

  final List<String> todosList= [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvents>(_addTodoEvent);

    on<RemoveToDoEvents>(_removeTodoEvent);
  }

  void _addTodoEvent(AddToDoEvents event, Emitter<ToDoState> emit) {
    todosList.add(event.task);
    emit(state.copyWith(todoList: List.from(todosList)));
  }

  void _removeTodoEvent(RemoveToDoEvents event, Emitter<ToDoState> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todosList)));
  }
  
}
