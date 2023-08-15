import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final image_url = "https://admin.biyografya.com/_docs/photos/4047282e01db033a0727ef03365e92c9.jpg" ;
    return  Drawer(
      child: Container(
        color: Colors.grey[300],
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.yellow[300],
                ),
              accountName: Text('Aman Gupta'),
                  accountEmail: Text('amangupta1a2b3c@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(image_url),
                ),
                ) ,
            ),
            ListTile(
              leading: Icon( CupertinoIcons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon( CupertinoIcons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon( CupertinoIcons.shopping_cart),
              title: Text('Cart'),
            )
          ],
        ),
      ),
    );
  }
}
