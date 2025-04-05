import 'package:crafty_bay/feature/common/controller/main_bottom_nav_index_controller.dart';
import 'package:crafty_bay/feature/common/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.find<MainBottomNavIndexController>().backHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavIndexController>().backHome();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: Text('Category', style: TextStyle(fontSize: 24)),
        ),
        body: GridView.builder(
          itemCount: 10,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return CategoryItem(
              iconData: Icons.laptop,
              title: 'Laptop',
              onTab: () {},
            );
          },
        ),
      ),
    );
  }
}
