import 'package:catalog_app/widgets/MyTheme.dart';
import 'package:flutter/material.dart';

import '../models/catalog.dart';
import 'cart_screen.dart';

class ProductDetails extends StatelessWidget {
  final Item catalog ;
  const ProductDetails({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
        Text("\$${catalog.price}",  style: TextStyle(
          fontWeight: FontWeight.bold , color: MyTheme.darkBluish,fontSize: 25,
        ),),
        ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>CartPage() )), child: Text("Add to Cart"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            shape: MaterialStateProperty.all(StadiumBorder()),
          ),),
          ],
        ),
      ),
      body: SafeArea(

        child: Column(
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image,fit:BoxFit.fill,)),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40 ),topRight: Radius.circular(40)),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(catalog.title , style: TextStyle(
                      fontWeight: FontWeight.bold , color: MyTheme.darkBluish,fontSize: 30,
                    ),),
                    Text(catalog.dec , style: TextStyle(
                        color: Colors.grey[500] , fontSize: 15,
                    ),),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
