import 'package:bloc/bloc.dart';
import 'package:bloc_course/bloc/image_picker/bloc/image_picker_event.dart';
import 'package:bloc_course/bloc/image_picker/bloc/image_picker_state.dart';
import 'package:bloc_course/ui/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';





class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils; 
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(pickImageGallery);

  }
  void cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit)async{

    XFile? file=await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));

  }
  void pickImageGallery(GalleryImagePicker event, Emitter<ImagePickerState> emit)async{

    XFile? file=await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));

  }
}
