import 'package:crafty_bay/feature/common/widgets/product_card.dart';
import 'package:crafty_bay/feature/product/controller/product_list_controller.dart';
import 'package:crafty_bay/feature/product/data/product_get_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  static String name = "/ProductList";
  final Map<String,dynamic> category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productController = ProductListController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productController.getProduct(ProductGetRequestModel(category: widget.category['id']??''));
  }

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
        title: Text(widget.category['title'], style: TextStyle(fontSize: 24)),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: GetBuilder(
          init: _productController,
          builder: (controller) {
            return
              controller.inProgress ? Center(child: CircularProgressIndicator()):
              GridView.builder(
              itemCount: controller.producvtList.length,
              padding: EdgeInsets.symmetric(horizontal: 14),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 230,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return FittedBox(child: ProductCart(
                  products: controller.producvtList[index],
                ));
              },
            );
          }
        ),
      ),
    );
  }
}
