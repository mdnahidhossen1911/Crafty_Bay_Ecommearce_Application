import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                SizedBox(
                  height: 124,
                  width: double.maxFinite,
                  child: Image.network(
                    'https://static-01.daraz.com.bd/p/1170742dc95517df094c34a95b205ca1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.themeColor,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.grey.shade300, size: 16),
            ],
          ),
          Text(
            'Apple introduces iPhone 16',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w500, height: 1.3),
          ),
          SizedBox(height: 2),
          Text(
            '\$599 ',
            style: TextStyle(
              color: AppColors.themeColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
