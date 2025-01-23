import 'package:bloc/bloc.dart';
import 'package:bloc_course/bloc/post/post_bloc/post_event.dart';
import 'package:bloc_course/model/posts_model.dart';
import 'package:bloc_course/repository/post_repository.dart';
import 'package:bloc_course/ui/utils/enums.dart';
import 'package:equatable/equatable.dart';


part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> temPostList=[]; 
  PostRepository postRepository=PostRepository();
  PostBloc() : super(PostState()) {
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_filterList );
 
  }
  void _filterList(SearchItem event, Emitter<PostState> emit)async{
    temPostList=state.postList.where((element)=>element.id.toString()==event.stSearch.toString()).toList();
    emit(state.copyWith(temPostList: temPostList));

  }
  void fetchPostApi(PostFetched event, Emitter<PostState> emit)async{
    await postRepository.fetchPosts().then((value){
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: 'Success',
        postList: value,
      ));

    }).onError((error, stackTrace){
      emit(state.copyWith(postStatus: PostStatus.failure, message: error.toString()));

    });

  }
}
