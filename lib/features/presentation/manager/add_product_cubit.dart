import 'package:bloc/bloc.dart';
import 'package:fruitshub_dashboard/core/utilis/services/fire_base/cloud_storage_service.dart';
import 'package:fruitshub_dashboard/domain/entities/product_entity.dart';
import 'package:fruitshub_dashboard/domain/repos/image_repo.dart';
import 'package:fruitshub_dashboard/domain/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.productRepo, this.imageRepo) : super(AddProductInitial());
  final ProductRepo productRepo;
  final ImageRepo imageRepo;
  Future<void> addProduct(ProductEntity productEntity)async {
    emit(AddProductLoading());
    var result= await imageRepo.addImage(productEntity.imageFile!);
    result.fold(
        (failure){
          emit(AddProductFailure(errMessage:failure.toString() ));
        },(url)async{
          url=productEntity.imageUrl!;
          var result=await productRepo.addProduct(productEntity);
          result.fold(
                  (failure){
            emit(AddProductFailure(errMessage:failure.toString()));
          },(r){
            emit(AddProductSuccess());
      });
    }
    );
  }
  void onChange(Change<AddProductState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
