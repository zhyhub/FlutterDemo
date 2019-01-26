import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  Product(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: "商品列表",
    home: ProductListView(
        products:
            List.generate(20, (i) => Product("sushi : 商品 $i", "这是一个商品详情 $i"))),
  ));
}

class ProductListView extends StatelessWidget {
  final List<Product> products;

  ProductListView({Key key, @required this.products}) : super(key: key);

  _void(BuildContext context, int index) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(product: products[index])));
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("$result"),
      duration: Duration(milliseconds: 1000),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(products[index].title),
            onTap: () {
              _void(context, index);
            },
          );
        },
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${product.title}"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("${product.description}"),
          onPressed: () {
            Navigator.pop(context, "${product.description}");
          },
        ),
      ),
    );
  }
}
