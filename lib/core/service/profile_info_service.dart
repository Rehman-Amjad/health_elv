import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../path_file.dart';

class ProfileInfoService {


  Future<UserData?> getUserData(uid) async {
    try {
      final res = await FirebaseFirestore.instance
          .collection(Collection.user.name)
          .doc(uid)
          .get();

      return UserData.fromMap(res.data()!);
    } on FirebaseException catch (e) {
      log(e.message.toString());
      return null;
    }
  }
}
