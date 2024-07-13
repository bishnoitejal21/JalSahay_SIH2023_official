// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class LossReport extends StatefulWidget {
//   @override
//   _LossReportState createState() => _LossReportState();
// }

// class _LossReportState extends State<LossReport> {
//   bool? _isMyProperty;
//   String? _selectedAsset;
//   File? _image;

//   Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? selectedImage = await _picker.pickImage(
//       source: ImageSource.gallery,
//     );

//     if (selectedImage != null) {
//       setState(() {
//         _image = File(selectedImage.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('INSTANT LOSS REPORT'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               InkWell(
//                 onTap: _pickImage,
//                 child: Row(
//                   children: [
//                     Icon(Icons.camera_alt, size: 30),
//                     SizedBox(width: 15.0),
//                     Expanded(
//                       child: Text(
//                         "Snap/Upload Image",
//                         style: TextStyle(fontSize: 18.0),
//                       ),
//                     ),
//                     _image != null
//                         ? Image.file(_image!,
//                             width: 70, height: 70, fit: BoxFit.cover)
//                         : Container(
//                             width: 70.0,
//                             height: 70.0,
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Icon(Icons.add_a_photo,
//                                 color: Colors.grey[600], size: 30),
//                           ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30.0),
//               Text("Whose property?",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 15.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   // Your button logic remains the same
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _isMyProperty = true;
//                       });
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.pressed) ||
//                               (_isMyProperty == true &&
//                                   !states.contains(MaterialState.pressed)))
//                             return Colors.blue[900]!;
//                           return Colors.blue;
//                         },
//                       ),
//                     ),
//                     child: Text("Mine"),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _isMyProperty = false;
//                       });
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.pressed) ||
//                               (_isMyProperty == false &&
//                                   !states.contains(MaterialState.pressed)))
//                             return Colors.blue[900]!;
//                           return Colors.blue;
//                         },
//                       ),
//                     ),
//                     child: Text("Public"),
//                   ),
//                 ],
//               ),
//               if (_isMyProperty == true) ...[
//                 SizedBox(height: 30.0),
//                 Text("Tap the type:",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 15.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         Icons.home,
//                         color: _selectedAsset == "House"
//                             ? Colors.blue[900]
//                             : Colors.grey,
//                         size: 30,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _selectedAsset = "House";
//                         });
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.directions_car,
//                         color: _selectedAsset == "Car"
//                             ? Colors.blue[900]
//                             : Colors.grey,
//                         size: 30,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _selectedAsset = "Car";
//                         });
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.phone_android,
//                         color: _selectedAsset == "Gadget"
//                             ? Colors.blue[900]
//                             : Colors.grey,
//                         size: 30,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _selectedAsset = "Gadget";
//                         });
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.build,
//                         color: _selectedAsset == "Other"
//                             ? Colors.blue[900]
//                             : Colors.grey,
//                         size: 30,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _selectedAsset = "Other";
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//               SizedBox(height: 30.0),
//               Text("AI Insight: Predicted: Major damage. Estimated loss: \$XXX",
//                   style: TextStyle(fontSize: 16)),
//               SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Agree?"),
//                   IconButton(
//                     icon: Icon(Icons.thumb_up),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.thumb_down),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30.0),
//               Center(
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     padding: MaterialStateProperty.all(
//                         EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
//                   ),
//                   onPressed: () {},
//                   child: Text("Send Report", style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
