import 'dart:io';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jalsahay_sih2023/src/features/views/controllers/problem_registration_controller.dart';

// import '../../../../../widgets/report_screen/categoryselector.dart';
import '../../report/widgets/categoryselector.dart';

// import '../../../../widgets/report_screen/categoryselector.dart';

class ProblemRegister extends StatefulWidget {
  final XFile? capturedImage;
  ProblemRegister({Key? key, required this.capturedImage}) : super(key: key);

  @override
  State<ProblemRegister> createState() => _ProblemRegisterState();
}

class _ProblemRegisterState extends State<ProblemRegister> {
  final animationTriggerNotifier = ValueNotifier<bool>(false);
  final ProblemRegistration _problemRegistration = ProblemRegistration();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String location;
  late String address;
  late String countryValue = 'India';
  late String stateValue;
  late String cityValue;
  late String description;
  String? categoryType;
  Uint8List? _image;

  // todo aply this to pick up image
  selectGallaryImage() async {
    XFile? im = widget.capturedImage;
    setState(() {
      _image = im as Uint8List?;
    });
  }

  imgFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 400);
    if (image != null) {
      setState(() {
        _image = File(image.path).readAsBytesSync();
      });
    }
  }

  _saveProblemDetail() async {
    EasyLoading.show();
    if (_formKey.currentState!.validate()) {
      await _problemRegistration
          .registerProblem(_image, location, address, countryValue, stateValue,
              cityValue, description, categoryType ?? "DefaultCategory")
          .whenComplete(() {
        EasyLoading.dismiss();

        setState(() {
          _formKey.currentState!.reset();
          _image = null;
        });
      });
    } else {
      print('not completed yet bro');
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    var ph = MediaQuery.of(context).size.height;
    var pw = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth: pw * 0.4,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: pw * 0.01,
            ),
            Image.asset('assets/images/png/preamble.png'),
            SizedBox(
              width: pw * 0.02,
            ),
            SizedBox(
              // height: ph * 0.02,
              width: pw * 0.2,
              child: Image.asset(
                'assets/images/png/digital_india.png',
                // width: pw * 0.05, // Explicit width
                // height: ph * 0.03,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        actions: [
          Image.asset('assets/images/png/english_hindi_translate.png'),
          SizedBox(
            width: pw * 0.02,
          ),
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColorLight,
            child: const Icon(Icons.person),
          ),
          SizedBox(
            width: pw * 0.01,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: ph * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: widget.capturedImage != null
                      ? Image.file(
                          File(widget.capturedImage!.path),
                          fit: BoxFit.cover,
                        )
                      : const Center(child: Text("No image selected")),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: ph * 0.05,
                      width: pw * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          location = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter location';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Locate on map',
                            prefixIcon: Icon(Icons.location_on),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: ph * 0.01,
                    ),
                    Container(
                      height: ph * 0.05,
                      width: pw * 0.9,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          address = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                            hintText: 'Address',
                            prefixIcon: Icon(Icons.location_city),
                            border: InputBorder.none),
                      ),
                    ),
                    // SizedBox(
                    //   height: ph * 0.01,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SelectState(
                        onCountryChanged: (India) {
                          setState(() {
                            countryValue = India;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Choose your problem type',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: ph * 0.005,
                                  ),
                                  CategorySelector(
                                    onCategorySelected: (selectedCategory) {
                                      setState(() {
                                        categoryType = selectedCategory;
                                      });
                                    },
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // height: ph * 0.05,
                      width: pw * 0.9,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextFormField(
                            onChanged: (value) {
                              description = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter description';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            decoration: const InputDecoration(
                              hintText: 'Description',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ph * 0.01,
                    ),
                    InkWell(
                        onTap: () {
                          _saveProblemDetail();
                        },
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button press here
                          },
                          child: Text('Submit'),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
