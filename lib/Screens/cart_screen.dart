import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/widgets/MyTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: CartList(),
            ),
          ),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image.network(_cart.items[index].image),
        trailing: IconButton(
            onPressed: () => _cart.remove(_cart.items[index]),
            icon: Icon(CupertinoIcons.delete_simple)),
        title: Text(_cart.items[index].title),
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final _cart = CartModel();
  final _paymentItems = <PaymentItem>[];
  @override
  Widget build(BuildContext context) {
    _paymentItems.add(
      PaymentItem(amount: _cart.totalPrice.toString(), label: 'pay amount'),
    );
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${_cart.totalPrice}",
              style: TextStyle(
                fontSize: 30,
                color: MyTheme.darkBluish,
              ),
            ),

            GooglePayButton(
              paymentConfiguration: PaymentConfiguration.fromJsonString(
                  'default_payment_profile_google_pay.json'),
              paymentItems: _paymentItems,
              type: GooglePayButtonType.pay,
              margin: const EdgeInsets.only(top: 15.0),
              onPaymentResult: (data) {
                print(data);
              },
              loadingIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            // onPressed: () {
            //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //     content: Text(
            //         " Hurrayy!! Your order has been placed successfully"),
            //   ));
            // },
            // child: Text("Buy"),
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            //   minimumSize: MaterialStateProperty.all(Size(120, 35)),
            // ),
          ],
        ),
      ),
    );
  }
}
