import 'package:flutter/material.dart';

class ProductAddReviewScreen extends StatefulWidget {
  const ProductAddReviewScreen({super.key});

  static String name = '/ProductAddReview';

  @override
  State<ProductAddReviewScreen> createState() => _ProductAddReviewScreenState();
}

class _ProductAddReviewScreenState extends State<ProductAddReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('Add Reviews', style: TextStyle(fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              SizedBox(height: 52),
              TextField(
                decoration: InputDecoration(
                  hintText: 'First name'
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Last name'
                ),
              ),
              SizedBox(height: 16),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: 'Write Review',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),

                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {

              }, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
