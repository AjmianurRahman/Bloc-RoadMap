import 'package:block_roadmap/Bloc/counter/counter_bloc.dart';
import 'package:block_roadmap/Bloc/favourite/favourite_bloc.dart';
import 'package:block_roadmap/Bloc/image%20picker/image_picker_bloc.dart';
import 'package:block_roadmap/Bloc/posts/posts_bloc.dart';
import 'package:block_roadmap/Bloc/switch%20bloc/switch_bloc.dart';
import 'package:block_roadmap/Bloc/todo/to_do_bloc.dart';
import 'package:block_roadmap/Ui/counter_screen.dart';
import 'package:block_roadmap/repository/favourite_repository.dart';
import 'package:block_roadmap/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context)=> ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context)=> ToDoBloc()),
        BlocProvider(create: (context)=> FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (context)=> PostsBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
           useMaterial3: true,
        ),
        home: const CounterScreen(),
      ),
    );
  }
}
