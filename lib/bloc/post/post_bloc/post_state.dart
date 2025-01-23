part of 'post_bloc.dart';

class PostState extends Equatable {

  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String message;
  const PostState({
    this.postStatus=PostStatus.loading,
    this.postList=const [],
    this.temPostList= const [],
    this.message=''
});

PostState copyWith({PostStatus? postStatus, List<PostModel>? postList, String? message, List<PostModel>? temPostList }){
  return PostState(
    postStatus: postStatus?? this.postStatus,
    postList: postList?? this.postList,
    temPostList:temPostList??this.temPostList ,
    message: message?? this.message

  );
}
  
  @override
  List<Object> get props => [postStatus, postList, temPostList, message];
}


