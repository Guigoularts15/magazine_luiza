import 'package:flutter/material.dart';
import 'package:magazine_luiza/models/product.dart';
import 'package:magazine_luiza/provider/list_of_products.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0083cb),
          title: Text(
            "Ofertas do dia",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          leading: Container(
            margin: EdgeInsets.all(10),
            child: Image.asset(
              "assets/images/logo.jpg",
            ),
          ),
        ),
        body: Column(
          children: [
            FittedBox(
              child: Image.asset("assets/images/linha.jpg"),
              fit: BoxFit.fitWidth,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: builder,
                itemCount: listOfProducts.length,
                separatorBuilder: (_, index) {
                  return Divider();
                },
              ),
            )
          ],
        ));
  }

  Widget builder(BuildContext _, int index) {
    Product _product = listOfProducts.elementAt(index);
    return ListTile(
      leading: Wrap(
        children: [
          Image.asset(
            _product.photo,
            scale: 3,
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _product.productName,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _product.description,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            _product.price,
            style: TextStyle(
              color: Color(0xff0083cb),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            _product.timesPrice,
            style: TextStyle(
                color: Color(0xff0083cb),
                fontSize: 10,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
      trailing: IconButton(
        icon: (_product.isFavorite
            ? Icon(
                Icons.favorite,
                color: Color(0xffdb45a8),
              )
            : Icon(
                Icons.favorite_outline,
                color: Color(0xffdb45a8),
              )),
        onPressed: () {
          setState(() {
            _product.isFavorite = !_product.isFavorite;
          });
        },
      ),
    );
  }
}
