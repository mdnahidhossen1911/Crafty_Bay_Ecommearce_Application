import 'package:crafty_bay/feature/common/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  static String name = "/ProductList";
  final String category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(widget.category, style: TextStyle(fontSize: 24)),
        forceMaterialTransparency: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 14),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 230,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FittedBox(child: ProductCart());
        },
      ),
    );
  }
}
