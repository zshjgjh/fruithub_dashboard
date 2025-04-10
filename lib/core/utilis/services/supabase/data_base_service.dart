import 'package:fruitshub_dashboard/core/utilis/services/fire_base/fire_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaDataBase implements DataBase {
  static late Supabase supabase;

  @override
  Future<void> addData({required String path, required Map<String,
      dynamic> data, String? id}) async {
    await supabase.client
        .from(path)
        .insert(data); // path same as bucket name
  }

  @override
  Future<dynamic> getData(
      {required String path, Map<String, dynamic>? query, String? id}) async {
    var data = (await supabase.client
        .from(path)
        .select()) as PostgrestFilterBuilder<List<Map<String, dynamic>>>;
    if (query != null) {
      if (query['orderBy'] != null) {
        var orderByField = query['orderBy'];
        var descending = query['descending'];
        data = await data.order(
            orderByField, ascending: !descending) as PostgrestFilterBuilder<
            List<Map<String, dynamic>>>;
      }
      if (query['limit'] != null) {
        var limit = query['limit'];
        data = await data.limit(limit) as PostgrestFilterBuilder<
            List<Map<String, dynamic>>>;
      }
    }

    return data;
  }
}