import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/feature/common/controller/main_bottom_nav_index_controller.dart';
import 'package:crafty_bay/feature/product/widgets/increment_decrement_count_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
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
          title: Text('Card', style: TextStyle(fontSize: 24)),
          forceMaterialTransparency: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                padding: EdgeInsets.only(bottom: 40),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      height: 100,
                      width: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdo73h5vAG2Zl8sO7-ocw5JRqMXTuvAu8M-Q&s',
                        ),
                      ),
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Year Special Shoe',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Color: Red, Size: X',
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.delete_simple,color: Colors.grey,)
                      ],
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$100',
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IncrementDecrementCountWidget(),
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.grey.shade100,);
              },
              ),
            ),
            _buildPriceAndChackOut(),
          ],
        ),
      ),
    );
  }

  Container _buildPriceAndChackOut() {
    return Container(
      height: 70,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$1233',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.themeColor,
              fixedSize: Size(120, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
