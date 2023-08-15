import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
class ItemWidget extends StatelessWidget {
  final Item item ;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        leading: Image.network(item.image),
        title: Text( item.title),
        subtitle: Text( item.dec),
        trailing: Text(" \$${item.price}"),
      ),
    );
  }
}
