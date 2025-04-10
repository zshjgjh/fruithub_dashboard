import 'package:dartz/dartz.dart';
import 'package:fruitshub_dashboard/domain/entities/product_entity.dart';

import '../../core/errors/server_failure.dart';

abstract class ProductRepo{
  Future<Either<Failure,void>> addProduct(ProductEntity productEntity);
  Future<Either<Failure,List<ProductEntity>>> getProducts();
}