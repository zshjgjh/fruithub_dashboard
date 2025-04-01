





import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStore{

  Future<void> addData({required String path, required Map<String,dynamic> data,String? id}) ;
  Future<dynamic> getData({required String path, String? id});

}


class FireStorageService implements FireStore{

  FirebaseFirestore firestore=FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? id}) async {
    await firestore.collection(path).doc(id).set(data);
  }

  @override
  Future<dynamic> getData({required String path, String? id}) async {
    if(id !=null){
    var data= await  firestore.collection(path).doc(id).get();
    return data.data() as Map<String,dynamic>;
  }else{
      var data= await  firestore.collection(path).get();
      return data.docs.map((e) => e.data()).toList();
    }
  }


}