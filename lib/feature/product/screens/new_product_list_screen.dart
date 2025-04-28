import 'package:crafty_bay/feature/common/controller/new_product_list_controller.dart';
import 'package:crafty_bay/feature/common/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductListScreen extends StatefulWidget {
  const NewProductListScreen({super.key});

  static String name = "/NewProductList";

  @override
  State<NewProductListScreen> createState() => _NewProductListScreenState();
}

class _NewProductListScreenState extends State<NewProductListScreen> {

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(pagination);
  }
  void pagination(){
    if(_scrollController.position.extentAfter < 300){
      Get.find<NewProductListController>().getProduct();
    }
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
        title: Text('New', style: TextStyle(fontSize: 24)),
        forceMaterialTransparency: true,
      ),
      body: GetBuilder<NewProductListController>(
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
    );
  }
}
