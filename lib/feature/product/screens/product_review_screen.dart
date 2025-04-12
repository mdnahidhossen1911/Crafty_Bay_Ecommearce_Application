import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/feature/product/screens/product_add_review_screen.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  static String name = '/ProductReview';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('Reviews', style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 16,
                            child: Icon(Icons.person),
                          ),
                          SizedBox(width: 8),
                          Text('Nahid Hossen'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.grey.shade200);
                },
              ),
            ),
            _buildReviewCountAndAddButton(),
          ],
        ),
      ),
    );
  }

  Container _buildReviewCountAndAddButton() {
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
                  'Reviews  (1000)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ProductAddReviewScreen.name);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.themeColor,
              fixedSize: Size(80, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 26),
          ),
        ],
      ),
    );
  }
}
