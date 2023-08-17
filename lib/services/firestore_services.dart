import 'package:e_mart_app/consts/consts.dart';

class FirestorServices {

  // get users data

  static getUser(uid){
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

}