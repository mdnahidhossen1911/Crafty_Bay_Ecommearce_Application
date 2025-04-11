import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key});

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int _sizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _sizeIndex = index;
              setState(() {});
            },
            child: Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _sizeIndex ==index ? AppColors.themeColor :Colors.white,
                border: Border.all(
                  color: _sizeIndex != index ?Colors.grey : Colors.transparent
                )
              ),
              child: Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    fontSize: 11,
                    color: _sizeIndex == index ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
