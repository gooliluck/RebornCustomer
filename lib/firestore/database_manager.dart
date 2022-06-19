import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gooliluck_customer_controller/utils.dart';

class FireStoreDataBase{
  List userList = [];
  final CollectionReference collectionRef = FirebaseFirestore.instance.collection("Users");
  Future getData() async {
    try{
      await collectionRef.get().then((querySnapShot) {
        for(var result in querySnapShot.docs){
          logI("result:${result.toString()}");
        }
      }
      );
    } catch (e) {
      logE('getting data error : ${e.toString()}');
      return null;
    }
  }
}