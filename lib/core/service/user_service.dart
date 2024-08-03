// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class UserService {
//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//
//   Future<void> updateProfile({
//     required String name,
//     required String email,
//     required String gender,
//     File? image,
//   }) async {
//     // Get the current user document
//     DocumentSnapshot userDoc = await _fireStore.collection('users')
//         .doc(<USER_ID>)
//         .get();
//
//     // Update the user document with the new profile data
//     _fireStore.collection('users').doc(<USER_ID>).update({
//       'name': name,
//       'email': email,
//       'gender': gender,
//       'updated_at': Timestamp.now(),
//     });
//
//     // If an image was provided, upload it to Firebase Storage and update the user document with the image URL
//     if (image != null) {
//       Reference storageRef = _storage.ref().child('users')
//           .child(<USER_ID>)
//           .child('profile_picture');
//       UploadTask uploadTask = storageRef.putFile(image);
//       TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));
//       String imageUrl = await downloadUrl.ref.getDownloadURL();
//       _fireStore.collection('users').doc(<USER_ID>).update({
//         'profile_picture_url': imageUrl,
//       });
//     }
//   }
//
//   Future<String> uploadProfileImage(File image) async {
//     Reference storageRef = _storage.ref().child('users').child(<USER_ID>).child(
//         'profile_picture');
//     UploadTask uploadTask = storageRef.putFile(image);
//     TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));
//     return await downloadUrl.ref.getDownloadURL();
//   }
// }