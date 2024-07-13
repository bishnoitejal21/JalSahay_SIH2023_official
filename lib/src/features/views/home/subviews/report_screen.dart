// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:jalsahay_sih2023/views/controllers/problem_registration_controller.dart';
// import 'package:jalsahay_sih2023/widgets/report_screen/categoryselector.dart';
// import 'package:jalsahay_sih2023/widgets/report_screen/districtselector.dart';
// import 'package:jalsahay_sih2023/widgets/report_screen/stateselector.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// class ReportScreen extends StatefulWidget {
//   final XFile? capturedImage;

//   const ReportScreen({Key? key, required this.capturedImage}) : super(key: key);

//   @override
//   State<ReportScreen> createState() => _ReportScreenState();
// }

// class _ReportScreenState extends State<ReportScreen> {
//   final animationTriggerNotifier = ValueNotifier<bool>(false);
  
  

  

//   @override
//   Widget build(BuildContext context) {
//     var ph = MediaQuery.of(context).size.height;
//     var pw = MediaQuery.of(context).size.width;
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         leadingWidth: pw * 0.4,
//         leading: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: pw * 0.01,
//             ),
//             Image.asset('assets/images/png/preamble.png'),
//             SizedBox(
//               width: pw * 0.02,
//             ),
//             Container(
//               // height: ph * 0.02,
//               width: pw * 0.2,
//               child: Image.asset(
//                 'assets/images/png/digital_india.png',
//                 // width: pw * 0.05, // Explicit width
//                 // height: ph * 0.03,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           Image.asset('assets/images/png/english_hindi_translate.png'),
//           SizedBox(
//             width: pw * 0.02,
//           ),
//           CircleAvatar(
//             backgroundColor: Theme.of(context).primaryColorLight,
//             child: Icon(Icons.person),
//           ),
//           SizedBox(
//             width: pw * 0.01,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   height: ph * 0.4,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Theme.of(context).primaryColorLight,
//                   ),
//                   child: widget.capturedImage != null
//                       ? Image.file(
//                           File(widget.capturedImage!.path),
//                           fit: BoxFit.cover,
//                         )
//                       : Center(child: Text("No image selected")),
//                 ),
//               ),
//               Container(
//                 height: ph * 0.05,
//                 width: pw * 0.9,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black),
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       hintText: 'Locate on map',
//                       prefixIcon: Icon(Icons.location_on),
//                       border: InputBorder.none),
//                 ),
//               ),
//               SizedBox(
//                 height: ph * 0.01,
//               ),
//               Container(
//                 height: ph * 0.05,
//                 width: pw * 0.9,
//                 decoration: BoxDecoration(
//                   // color: Colors.red,
//                   border: Border.all(width: 1, color: Colors.black),
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       hintText: 'Address',
//                       prefixIcon: Icon(Icons.location_city),
//                       border: InputBorder.none),
//                 ),
//               ),
//               // SizedBox(
//               //   height: ph * 0.01,
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     StateSelector(),
//                     Spacer(),
//                     DistrictSelector(),
//                   ],
//                 ),
//               ),
          
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   height: ph * 0.18,
//                   width: double.infinity,
//                   // color: Colors.amber,
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.black),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Choose your problem type',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: ph * 0.005,
//                           ),
//                           CategorySelector(),
//                           Container(
//                             child: TextField(
//                               maxLines: null,
//                               keyboardType: TextInputType.text,
//                               decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText:
//                                       'Briefly describe your problem here..'),
//                             ),
//                           )
//                         ]),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: ph * 0.01,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle button press here
//                 },
//                 child: Text('    Submit    '),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
