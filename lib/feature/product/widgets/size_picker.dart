import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});
  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _sizeIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.sizes.length,
        itemBuilder: (context, index) {
          String size = widget.sizes[index];
          return GestureDetector(
            onTap: () {
              _sizeIndex = size;
              widget.onChange(size);
              setState(() {});
            },
            child: Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _sizeIndex ==size ? AppColors.themeColor :Colors.white,
                border: Border.all(
                  color: _sizeIndex != size ?Colors.grey : Colors.transparent
                )
              ),
              child: Center(
                child: Text(
                  size,
                  style: TextStyle(
                    fontSize: 11,
                    color: _sizeIndex == size ? Colors.white : Colors.grey,
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
