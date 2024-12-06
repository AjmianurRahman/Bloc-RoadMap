import 'dart:io';

import 'package:block_roadmap/Bloc/image%20picker/image_picker_bloc.dart';
import 'package:block_roadmap/Bloc/image%20picker/image_picker_event.dart';
import 'package:block_roadmap/Bloc/image%20picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  if (state.file == null) {
                    return InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(CameraCaputre());
                        },
                        child: const CircleAvatar(child: Icon(
                          Icons.camera, size: 18, color: Colors.black,),));
                  } else {
                    return Image.file(File(state.file!.path.toString()));
                  }
                })
          ],
        ),
      ),
    );
  }
}
