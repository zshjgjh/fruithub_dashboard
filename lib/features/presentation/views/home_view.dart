import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitshub_dashboard/core/utilis/services/fire_base/cloud_storage_service.dart';
import 'package:fruitshub_dashboard/core/utilis/services/fire_base/fire_storage_service.dart';
import 'package:fruitshub_dashboard/features/presentation/manager/add_product_cubit.dart';
import 'package:fruitshub_dashboard/features/presentation/views/widgets/home_view_body.dart';

import '../../../data/repos_impl/image_repo_imp_cloudstorage-servicel.dart';
import '../../../data/repos_impl/product_repo_impl_firestor_service.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AddProductCubit>(
        create: (context) {
         return AddProductCubit(
              ProductRepoImpl(fireStorageService: FireStorageService()),
              ImageRepoImpl(cloudStorageService: CloudStorageService()));
        },
        child: HomeViewBody(),
      ),
    );
  }
}