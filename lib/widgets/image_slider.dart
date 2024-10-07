import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWithLocalImages extends StatefulWidget {
  CarouselWithLocalImages({super.key});

  @override
  State<CarouselWithLocalImages> createState() => _CarouselWithLocalImagesState();
}

class _CarouselWithLocalImagesState extends State<CarouselWithLocalImages> {
  final List<String> imagePaths = [
    AppAssets.img86,
    AppAssets.img87,
    AppAssets.img88,
    AppAssets.img89,
    AppAssets.img90,
    AppAssets.img91,
    AppAssets.img92,
    AppAssets.img93,
    AppAssets.img94,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
               setState(() {
                 _currentIndex = index;
               });
              },
            ),
            items: imagePaths.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover, // Ensure the image fits properly
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          buildDotIndicator(),
        ],
      ),
    );
  }

  Widget buildDotIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _currentIndex, // The current active page index
      count: imagePaths.length, // Total number of pages
      effect: ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: AppColors.primaryColor,
        dotColor: Colors.grey,
      ),
    );
  }
}
