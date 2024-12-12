part of 'posts_bloc.dart';

final class PostsState extends Equatable {
  PostStatus postsState;
  final List<PostsModel> postList;
  final List<PostsModel> tempPostList;
  final String message;
  final String searchMessage;

  PostsState(
      {this.postList = const [],
      this.tempPostList = const [],
      this.message = '',
      this.searchMessage = '',
      this.postsState = PostStatus.LOADING});

  PostsState copyWith(
      {PostStatus? postsState,
      List<PostsModel>? postList,
      List<PostsModel>? tempPostList,
      String? message,
      String? searchMessage}) {
    return PostsState(
        postList: postList ?? this.postList,
        tempPostList: tempPostList ?? this.tempPostList,
        postsState: postsState ?? this.postsState,
        message: message ?? this.message,
        searchMessage: searchMessage ?? this.searchMessage);
  }

  @override
  List<Object> get props =>
      [postsState, postList, message, tempPostList, searchMessage];
}
