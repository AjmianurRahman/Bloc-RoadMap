part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object?> get props => [];
}

class PostFetchEvent extends PostsEvent{}
class SearchFetchEvent extends PostsEvent{
  final String searchText;

 const SearchFetchEvent(this.searchText);

  @override
  List<Object> get props => [];
}

