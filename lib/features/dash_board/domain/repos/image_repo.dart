import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruitshub_dashboard/core/utilis/constants.dart';
import 'package:fruitshub_dashboard/core/utilis/services/fire_base/cloud_storage_service.dart';

import '../../core/errors/server_failure.dart';

abstract class ImageRepo{
  Future<Either<Failure,String>> addImage(File image);
}

