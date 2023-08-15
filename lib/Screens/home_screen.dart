import 'dart:convert';

import 'package:catalog_app/Screens/cart_screen.dart';
import 'package:catalog_app/Screens/product_detail.dart';
import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/widgets/ItemWidget.dart';
import 'package:catalog_app/widgets/MyDrawer.dart';
import 'package:catalog_app/widgets/MyTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/catalog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamcolor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => CartPage())),
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Catalog App",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.darkBluish,
                  ),
                ),
                Text(
                  "Trending Products",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[700],
                  ),
                ),
                Expanded(child: CatalogList()),
              ],
            ),
          ),
        ));
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          child: CatalogItem(catalog: catalog),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetails(catalog: catalog))),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 15, bottom: 15),
      // padding: EdgeInsets.all(8),
      height: 200,
      width: 150,

      child: Row(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyTheme.creamcolor,
            ),
            padding: EdgeInsets.all(16),
            child: Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image,
                  fit: BoxFit.fill,
                )),
            width: 160,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  catalog.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.darkBluish,
                    fontSize: 20,
                  ),
                ),
                Text(
                  catalog.dec,
                  style: TextStyle(color: Colors.grey[500]),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${catalog.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyTheme.darkBluish,
                        fontSize: 20,
                      ),
                    ),
                    _AddToCartState(
                      catalog: catalog,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AddToCartState extends StatefulWidget {
  final Item catalog;

  const _AddToCartState({super.key, required this.catalog});

  @override
  State<_AddToCartState> createState() => _AddToCartStateState();
}

class _AddToCartStateState extends State<_AddToCartState> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = true;
        final _cart = CartModel();
        final _catalog = CatalogModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      child: isAdded ? Icon(Icons.done) : Text("Add to Cart"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    );
  }
}
