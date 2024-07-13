import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final String imagePath; // The path to the image asset.
  final String labelText;

  CategoriesWidget({required this.imagePath, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 70,
      // padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // color: Colors.amber,
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 65,
            // color: Colors.red,
            child: Image.asset(
              imagePath,
              width: double
                  .infinity, // Default width for the image. Adjust as needed.
              // Default height for the image. Adjust as needed.
              fit: BoxFit.fill, // Default BoxFit. Adjust as needed.
            ),
          ),
          SizedBox(height: 3),
          Text(
            labelText,
            style: TextStyle(
              fontSize: 11, // Default font size for the text.
              fontWeight: FontWeight.bold, // Default font weight for the text.
              color: Colors.black, // Default color for the text.
            ),
          ),
        ],
      ),
    );
  }
}
