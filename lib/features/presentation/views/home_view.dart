import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitshub_dashboard/core/utilis/services/fire_base/cloud_storage_service.dart';
import 'package:fruitshub_dashboard/core/utilis/services/fire_base/fire_storage_service.dart';
import 'package:fruitshub_dashboard/core/utilis/services/supabase/subabase_data_base_service.dart';
import 'package:fruitshub_dashboard/core/utilis/services/supabase/supabase_storage_service.dart';
import 'package:fruitshub_dashboard/data/repos_impl/supabase/image_repo_impl_supabase.dart';
import 'package:fruitshub_dashboard/data/repos_impl/supabase/product_repo-impl_supabase.dart';
import 'package:fruitshub_dashboard/features/presentation/manager/add_product_cubit.dart';
import 'package:fruitshub_dashboard/features/presentation/views/widgets/home_view_body.dart';

import '../../../data/repos_impl/fire_store/image_repo_impl_cloudstorage-servicel.dart';
import '../../../data/repos_impl/fire_store/product_repo_impl_firestor_service.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AddProductCubit>(
        create: (context) {
         return AddProductCubit(
              ProductRepoImplSupabase(supabaseDataBase: SupaBaseDataBase()),
              ImageRepoImplSupabase(supaBaseStorageService: SupaBaseStorageService()));
        },
        child: HomeViewBody(),
      ),
    );
  }
}