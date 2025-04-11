import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductViewCarouselSlider extends StatefulWidget {
  const ProductViewCarouselSlider({
    super.key,
  });

  @override
  State<ProductViewCarouselSlider> createState() => _ProductViewCarouselSliderState();
}

class _ProductViewCarouselSliderState extends State<ProductViewCarouselSlider> {
  List carouselitem = [1,2,3,4,5];
  int _currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 240,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _currentItem = index;
              setState(() {});
            },
          ),
          items: carouselitem.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('https://pngimg.com/d/iphone_12_PNG23.png')),
                      color: Colors.grey.shade100,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0; i<carouselitem.length; i++)
                  Container(
                    height: 8,
                    width: i== _currentItem ?10:10,
                    margin: EdgeInsets.symmetric(horizontal: 1.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: i == _currentItem ?AppColors.themeColor : Colors.grey.shade300
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}