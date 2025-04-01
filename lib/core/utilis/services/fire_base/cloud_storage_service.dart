//
//
// import 'dart:html' as html;
// import 'dart:typed_data';
//
// import 'package:new_projects/core/utilis/services/supabase_storage_service.dart';
// import 'package:path/path.dart' as b;
//
//
// abstract class CloudStorage{
//
//   Future<void> uploadFile({required String path, required html.File file,}) ;
//
//
// }
//
//
// class CloudStorageService implements CloudStorage{
//   @override
//   Future<String> uploadFile({required String path, required html.File file}) async {// required File for and/ios
//
//    String fileName= b.basename(file.name);// use path library to get file name
//    String extensionName=b.extension(file.name);// use path library to get file extension like png
//    var fileReference=storage.child('$path/$fileName.$extensionName');//define path to store in fire storage
//
//    await fileReference.putData(file as Uint8List);//.putFile(file) for and/ios// store file
//    String fileUrl=await fileReference.getDownloadURL();// get string url for file location
//    return fileUrl;
//   }
//
//
// }