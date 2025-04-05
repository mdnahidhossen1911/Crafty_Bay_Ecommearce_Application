import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTab;

  const CategoryItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTab,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.teal.shade100.withOpacity(0.25),
                ),
                child: Icon(iconData, color: AppColors.themeColor, size: 30),
              ),
              SizedBox(height: 6),
              Text(
                title, // example long text
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center, // centers under the icon
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
