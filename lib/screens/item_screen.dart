import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/bloc/items_bloc.dart';
import 'package:test_task/model/items.dart';
import 'package:test_task/screens/detail_screen.dart';

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final ItemsBloc _newsBloc = ItemsBloc();

  @override
  void initState() {
    _newsBloc.add(GetItemList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Demo Item List')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<ItemsBloc, ItemState>(
          listener: (context, state) {
            if (state is ItemError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ItemsBloc, ItemState>(
            builder: (context, state) {
              if (state is ItemInitial) {
                return _buildLoading();
              } else if (state is ItemLoading) {
                return _buildLoading();
              } else if (state is ItemLoaded) {
                return _buildCard(context, state.itemModel);
              } else if (state is ItemError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<Item> model) {
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          key: Key("goToDetailScreen"),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemDetailScreen(item: model[index])),
              );
            },
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: model[index].url!,
                      width: 100,
                      height: 100,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Album Id: ${model[index].albumId}"),
                            Text("Album Title: ${model[index].title}"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
