part of 'posts_bloc.dart';

final class PostsState extends Equatable {
  PostStatus postsState;
  final List<PostsModel> postList;
  final String message;

  PostsState(
      {this.postList = const [],
      this.message = '',
      this.postsState = PostStatus.LOADING});

  PostsState copyWith(
      {PostStatus? postsState, List<PostsModel>? postList, String? message}) {
    return PostsState(
        postList: postList ?? this.postList,
        postsState: postsState ?? this.postsState,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [postsState, postList, message];
}
