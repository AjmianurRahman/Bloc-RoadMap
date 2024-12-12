import 'package:bloc/bloc.dart';
import 'package:block_roadmap/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../model/PostsModel.dart';
import '../../repository/post_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<PostsModel> tempPostList = [];
  PostRepository postRepository = PostRepository();

  PostsBloc() : super(PostsState()) {
    on<PostFetchEvent>(_fetchPost);
    on<SearchFetchEvent>(_filterFetchPost);
  }

  void _fetchPost(PostFetchEvent event, Emitter<PostsState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postsState: PostStatus.SUCCESS, message: 'success', postList: value));
    }).onError((error, stackTrack) {
      emit(state.copyWith(
          postsState: PostStatus.FAILED, message: error.toString()));
    });
  }

  _filterFetchPost(SearchFetchEvent event, Emitter<PostsState> emit) {

    if(event.searchText.isEmpty){
      emit(state.copyWith(tempPostList:[], searchMessage: ''));
    }else{
       tempPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.searchText.toString().toLowerCase())).toList();


      if(tempPostList.isEmpty){
        emit(state.copyWith(tempPostList: List.from(tempPostList), searchMessage: 'NO DATA FOUND'));
      }else{
        emit(state.copyWith(tempPostList: List.from(tempPostList), searchMessage: ''));
      }
    }


  }
}
