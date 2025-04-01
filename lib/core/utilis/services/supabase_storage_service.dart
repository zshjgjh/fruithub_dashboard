import 'dart:io' show File;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import '../../errors/server_failure.dart';
import '../constants.dart';
import 'package:path/path.dart' as b;

abstract class SupaBaseStorage {
  Future<void> uploadFile({
    required String bucketName,
    required File file,
  });
  Future<void> addData(
      {required String path, required Map<String, dynamic> data, String? id});
  Future<dynamic> getData({required String path, String? id});
}

class SupaBaseStorageService implements SupaBaseStorage {
  static late Supabase supabase;

  static initSupabase() async {
    supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey, //we used secret key in API setting to be able to store files
    );
  }

  static createBucket(String bucketName) async {
    bool isBucketExist = false;
    var buckets = await supabase.client.storage.listBuckets();
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (isBucketExist == false) {
      await supabase.client.storage
          .createBucket(bucketName); //create bucket or folder
    }
  }

  @override
  Future<String> uploadFile({required String bucketName, required File file,}) async {

    String fileName =
        b.basename(file.path); // use path library to get file name
    String extensionName = b.extension(
        file.path); // use path library to get file extension like png

    try {
      var uploadedFile = await supabase.client.storage
          .from(bucketName)
          .upload('$bucketName/$fileName$extensionName', file); // store file in bucket

      String publicUrl = supabase.client.storage.from(bucketName).getPublicUrl(
          '$bucketName/$fileName$extensionName'); // get file public url

      return publicUrl;
    } catch (e) {
      print(e.toString());
      print('fail');

      return e.toString();
    }
  }

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? id}) async {
    await supabase.client.from(path).insert(data);
  }

  @override
  Future<dynamic> getData({required String path, String? id}) async {
    var data = await supabase.client.from(path).select();
    return data;
  }
}
