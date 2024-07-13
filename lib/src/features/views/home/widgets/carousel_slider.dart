// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class ImageCarousel extends StatelessWidget {
//   final String imageAssetPath;

//   ImageCarousel({required this.imageAssetPath});

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         // height: 400.0, // you can adjust the height as per requirement
//         viewportFraction: 1.0, // to display full width of screen
//         enlargeCenterPage: false,
//         autoPlay: true,
//       ),
//       items: [imageAssetPath].map((item) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset(item, fit: BoxFit.contain),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageAssetPaths;

  ImageCarousel({required this.imageAssetPaths});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.25,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.imageAssetPaths.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(item, fit: BoxFit.contain),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageAssetPaths.map((url) {
              int index = widget.imageAssetPaths.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
