import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;
  late CatalogModel _catalog;
  final List<int> _itemIds = [];
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
