
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCaputre>(cameraCapture);
  }

  void cameraCapture(CameraCaputre event, Emitter<ImagePickerState> emit) async{
    XFile? file = await imagePickerUtils.cameraCapture();
   emit(state.copyWith(file:file));
  }


}
