import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'subviews/problem_registration.dart';
import 'widgets/carousel_slider.dart';
import 'widgets/categories_widget.dart';
import 'widgets/icon_text.dart';


// import 'report_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? cameraImage; // Storing the image taken by camera and gallery as well

  Future<void> _pickImageFromCamera(BuildContext context) async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProblemRegister(capturedImage: image),
        ),
      );
    }
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProblemRegister(capturedImage: image),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var ph = MediaQuery.of(context).size.height;
    var pw = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: ph * 0.05,
                width: pw * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ph * 0.01,
            ),
            ImageCarousel(
              imageAssetPaths: [
                'assets/images/png/carousel_image1.png',
                'assets/images/png/carousel_image2.png',
              ],
            ),
            SizedBox(
              height: ph * 0.01,
            ),
            Text(
              'Report a problem',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: ph * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _pickImageFromCamera(context),
                  child: IconTextContainer(
                    icon: Icons.add_a_photo,
                    label: 'Camera',
                  ),
                ),
                SizedBox(
                  width: pw * 0.05,
                ),
                GestureDetector(
                  onTap: () => _pickImageFromGallery(context),
                  child: IconTextContainer(
                    icon: Icons.image,
                    label: 'Gallery',
                  ),
                )
              ],
            ),
            SizedBox(
              height: ph * 0.01,
            ),
            Text(
              'Categories',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: ph * 0.01,
            ),
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CategoriesWidget(
                              imagePath: 'assets/images/png/flooding.png',
                              labelText: 'Flooding'),
                          CategoriesWidget(
                              imagePath: 'assets/images/png/drainage.png',
                              labelText: 'Drainage'),
                          CategoriesWidget(
                              imagePath: 'assets/images/png/water_bodies.png',
                              labelText: 'Water Bodies'),
                          CategoriesWidget(
                              imagePath: 'assets/images/png/water_quality.png',
                              labelText: 'Water Quality'),
                        ]),
                    SizedBox(
                      height: ph * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoriesWidget(
                            imagePath: 'assets/images/png/others.png',
                            labelText: 'Others')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
