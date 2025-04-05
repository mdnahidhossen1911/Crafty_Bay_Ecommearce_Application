import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  List carouselitem = [1,2,3,4,5];
  int _currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180,
          viewportFraction: 1,
          autoPlay: true,
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
                    margin: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: NetworkImage('https://www.apple.com/v/iphone-16/f/images/meta/iphone-16_overview__fcivqu9d5t6q_og.png'),fit: BoxFit.cover),
                        color: Colors.teal,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200,blurRadius: 4)
                      ]
                    ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i=0; i<carouselitem.length; i++)
              Container(
                height: 8,
                width: i== _currentItem ?18:8,
                margin: EdgeInsets.symmetric(horizontal: 1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: i == _currentItem ?AppColors.themeColor : Colors.grey.shade300
                ),
              )
          ],
        )
      ],
    );
  }
}