import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProblemRegistration{
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  _uploadImageToStorage(Uint8List? image) async {
    Reference ref = _storage.ref().child('storeImages');
    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No image selected');
    }
  }

  Future<String> registerProblem(
    Uint8List? image,
    String location,
    String address,
    String countryValue,
    String stateValue,
    String cityValue,
    String description,
    String categoryType,
  ) async {
    String res = 'Some Error occurred';
    try {
      String storeImage = await _uploadImageToStorage(image);
      String collectionName;

      // Conditionally set the collection name based on categorytype
      switch (categoryType) {
        case 'drainage':
          collectionName = 'drainage';
          break;
        case 'urban flood':
          collectionName = 'urban_flood'; // Use snake_case or any naming convention you prefer
          break;
        case 'lake and ponds issue':
          collectionName = 'lake_ponds_issue'; // Use snake_case or any naming convention you prefer
          break;
        default:
          throw Exception('Invalid categorytype');
      }

      await _firestore.collection(collectionName).doc(address).set({
        'location': location,
        'address': address,
        'countryValue': countryValue,
        'stateValue': stateValue,
        'cityValue': cityValue,
        'description': description,
        'storeImage': storeImage,
        'categorytype': categoryType,
      });
      res = 'Data saved successfully';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
