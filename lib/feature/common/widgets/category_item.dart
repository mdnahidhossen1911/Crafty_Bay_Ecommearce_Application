import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTab;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: SizedBox(
        width: 90,
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: AppColors.themeColor.withOpacity(0.1),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  icon,
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              title, // example long text
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center, // centers under the icon
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
