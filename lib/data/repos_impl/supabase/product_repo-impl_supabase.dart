import 'package:dartz/dartz.dart';

import 'package:fruitshub_dashboard/core/errors/server_failure.dart';
import 'package:fruitshub_dashboard/core/utilis/constants.dart';
import 'package:fruitshub_dashboard/core/utilis/services/supabase/data_base_service.dart';

import 'package:fruitshub_dashboard/domain/entities/product_entity.dart';

import '../../../domain/repos/product_repo.dart';
import '../../models/product_model.dart';

class ProductRepoImpl implements ProductRepo{
  final SupaDataBase supaDataBase;

  ProductRepoImpl({required this.supaDataBase});
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity productEntity) async {
  try {
    var result= await supaDataBase.addData(path: kProductStorage, data:ProductModel.fromEntity(productEntity).toJason());
    return right(null);
  }  catch (e) {
    return left(ServerFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =await supaDataBase.getData(
          path: kProductStorage,
          query: {
            'orderBy':'sellingCount',
            'descending':true,
            'limit':10
          }) ;

      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data= await supaDataBase.getData(path: kProductStorage) as List<Map<String,dynamic>>;
      List<ProductModel> products= data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities=products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    }  catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}