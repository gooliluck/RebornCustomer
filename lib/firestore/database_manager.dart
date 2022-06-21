import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gooliluck_customer_controller/utils.dart';

class FireStoreDataBase{
  List userList = [];
  final CollectionReference collectionRef = FirebaseFirestore.instance.collection("Users");
  Future getCustomersData() async {
    try{
      var user = await getStringFromSharePreference("userId");
      await collectionRef.doc(user).collection("Customers").get().then((querySnapShot) {
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
  Future getServingsData() async {
    try{
      var user = await getStringFromSharePreference("userId");
      await collectionRef.doc(user).collection("Servings").get().then((querySnapShot) {
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
  Future getOrdersData() async {
    try{
      List orders = [];
      var user = await getStringFromSharePreference("userId");
      await collectionRef.doc(user).collection("Orders").get().then((querySnapShot) {

        for(var result in querySnapShot.docs){
          orders.add(result.data());
        }
      }
      );
      return orders;
    } catch (e) {
      logE('getting data error : ${e.toString()}');
      return null;
    }
  }
}