import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:test_task/model/items.dart';

class ItemDetailScreen extends StatelessWidget {
  Item item;
  ItemDetailScreen({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 80.0, right: 20, left: 20),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: item.url!,
            width: double.infinity,
            height: 400,
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Album Id: ${item.albumId}"),
          const SizedBox(
            height: 30,
          ),
          Text("Album Title: ${item.title}"),
        ],
      ),
    ));
  }
}
