import 'package:block_roadmap/Bloc/favourite/favourite_bloc.dart';
import 'package:block_roadmap/Bloc/favourite/favourite_bloc.dart';
import 'package:block_roadmap/Components/text300.dart';
import 'package:block_roadmap/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<FavouriteBloc>().add(FetchFavItemList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteInitial>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavItemList.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(DeleteItemEvent());
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.pink,
                    )),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<FavouriteBloc, FavouriteInitial>(
            builder: (context, state) {
              switch (state.listStatus) {
                case ListStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case ListStatus.failure:
                  return const Text300(
                      text: 'Something Went Wrong', fontSize: 15);
                case ListStatus.success:
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.favItemList.length,
                        itemBuilder: (context, index) {
                          final item = state.favItemList[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.value.toString()),
                              leading: Checkbox(
                                value: state.tempFavItemList.contains(item)
                                    ? true
                                    : false,
                                onChanged: (value) {
                                  if (value!) {
                                    context
                                        .read<FavouriteBloc>()
                                        .add(SelectItemEvent(itemModel: item));
                                  } else {
                                    context.read<FavouriteBloc>().add(
                                        UnSelectItemEvent(itemModel: item));
                                  }
                                },
                              ),
                              trailing: IconButton(
                                icon: item.isFavourite
                                    ? const Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.pink,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline_rounded,
                                      ),
                                onPressed: () {
                                  context.read<FavouriteBloc>().add(
                                      FavouriteItemEvent(
                                          itemModel: FavouriteItemModel(
                                              id: item.id,
                                              value: item.value,
                                              isFavourite: item.isFavourite
                                                  ? false
                                                  : true)));
                                },
                              ),
                            ),
                          );
                        }),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
