import 'dart:io';

import 'package:checkbox_list/checkbox_list.dart';
import 'package:flutter/material.dart';
import 'package:fruitshub_dashboard/core/widgets/custom_button.dart';
import 'package:fruitshub_dashboard/core/widgets/cutom_text-field.dart';
import 'package:fruitshub_dashboard/features/presentation/widgets/image_field.dart';

import '../../../core/utilis/styles.dart';
import '../../../core/widgets/build_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
String? name,code,description;
bool?isFeatured,isOrganic;
int?expMonthes,numOfCalories,unitAmount,ratingCount;
num?avgRating,price;
File?imageFile;

final GlobalKey<FormState> key=GlobalKey();
AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
          child: Form(
            key: key,
            child: Column(
              spacing: 24,
              children: [
               buildAppBar(title: 'Add product',context) ,
                CustomTextField(
                  labelText: 'product name',
                  style: Styles.bold19,
                  textInputType: TextInputType.name,
                  onSaved: (value){
                    name=value;
                  },
                ),
                CustomTextField(
                  labelText: 'price',
                  style: Styles.bold19,
                  textInputType:TextInputType.number ,
                  onSaved: (value){
                    price=num.tryParse(value!);
                  },
                ),
                CustomTextField(
                  labelText: 'code',
                  style: Styles.bold19,
                  hiddenText: false,
                  onSaved: (value){
                    code=value!.toLowerCase();
                  },
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: 'calories',
                        style: Styles.bold19,
                        textInputType:TextInputType.number ,
                        onSaved: (value){
                          numOfCalories=int.tryParse(value!);
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: 'per unit',
                        style: Styles.bold19,
                        textInputType:TextInputType.number ,
                        onSaved: (value){
                          unitAmount=int.tryParse(value!);
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: 'experation date',
                  style: Styles.bold19,
                  textInputType:TextInputType.datetime ,
                  onSaved: (value){
                    expMonthes=int.tryParse(value!);
                  },
                ),
                Row(
                  children: [
                    CustomCheckBox(
                        onChanged:(value){
                          isFeatured=value;
                        },
                      multipleChoice:false,
                      textLabel: '  is featured',
                      labelTextStyle: Styles.bold19,
                      checkIconColor: Colors.white,
                      selectedBoxColor: Styles.primaryColor,
                      checkBoxHeight: 25,
                      checkBoxWidth: 25,

                    ),
                    Spacer(),
                    CustomCheckBox(
                      onChanged:(value){
                        isOrganic=value;
                      },
                      multipleChoice:false,
                      textLabel: '  is organig',
                      labelTextStyle: Styles.bold19,
                      checkIconColor: Colors.white,
                      selectedBoxColor: Styles.primaryColor,
                      checkBoxHeight: 25,
                      checkBoxWidth: 25,

                    ),
                  ],
                ),
                CustomTextField(
                  labelText: 'description',
                  style: Styles.bold19,
                  maxLines: 5,
                  onSaved: (value){
                    description=value;
                  },
                ),
                ImageField(onFileChanged: (File? value) {
                  imageFile=value;
                },),
                CustomButton(
                    onPressed: (){
                      if(imageFile != null){//check if image not null
                        if(key.currentState!.validate())// check field not null
                        {
                          key.currentState!.save();
                        }else{
                          autovalidateMode=AutovalidateMode.always;
                        }
                      }else{
                        ScaffoldMessenger.of(context).
                        showSnackBar(const SnackBar(content: Text('please add an image')));
                      }
                    },
                    title: 'Add Product',
                    backgroundColor: Styles.primaryColor,
                    borderRadius: 12,
                    titleStyle: Styles.bold19.copyWith(color: Colors.white)
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}