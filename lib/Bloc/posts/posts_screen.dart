import 'package:block_roadmap/Bloc/posts/posts_bloc.dart';
import 'package:block_roadmap/Components/text300.dart';
import 'package:block_roadmap/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<PostsBloc>().add(PostFetchEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text300(text: 'Post Screen', fontSize: 15),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
                    switch (state.postsState) {
            case PostStatus.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.FAILED:
              return  Center(
                child: Text300(text:'Request Failed: '+state.message.toString(), fontSize: 17),
              );
            case PostStatus.SUCCESS:
              return Expanded(
                child: ListView.builder(itemCount: state.postList.length,
                    itemBuilder: (context, index) {
                  final item = state.postList[index];
                  return Card(
                    child: ListTile(
                      title: Text300(text: item.email.toString(),fontSize: 16,),
                      subtitle: Text300(text: item.body.toString(),fontSize: 14,),
                    ),
                  );
                }),
              );
                    }


                  }),
          )),
    );
  }
}
