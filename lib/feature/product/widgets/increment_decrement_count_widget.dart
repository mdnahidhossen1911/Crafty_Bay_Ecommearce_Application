import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class IncrementDecrementCountWidget extends StatefulWidget {
  const IncrementDecrementCountWidget({super.key});

  @override
  State<IncrementDecrementCountWidget> createState() =>
      _IncrementDecrementCountWidgetState();
}

class _IncrementDecrementCountWidgetState
    extends State<IncrementDecrementCountWidget> {
  int conut = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            conut++;
            setState(() {});
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.themeColor,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        SizedBox(width: 8),
        Text(
          '$conut',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            switch (conut) {
              case > 1:
              conut--;
            }
            setState(() {});
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color:
                  conut < 2
                      ? AppColors.themeColor.withOpacity(0.6)
                      : AppColors.themeColor,
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
