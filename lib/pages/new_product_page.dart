import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:productapp_batch7/db/dh_helper.dart';

import '../models/product_model.dart';
import '../utils/product_utils.dart';
class NewProductPage extends StatefulWidget {

  static final routeName ='new_product';
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {

  final _formKey = GlobalKey<FormState>();
  var productObj = Product();
  DateTime?_selectedDate;
  String _imagePath='';
  bool formCamera = true;
  //String categoryDropDown= categoryList[0];
  String ?categoryDropDown;


  _takePhoto(){
    ImagePicker().pickImage(source: formCamera?ImageSource.camera:ImageSource.gallery).then((pickedFile){
     setState(() {
       _imagePath=pickedFile!.path;
     });
     productObj.image=_imagePath;
    });
  }

  _openCalender()async{
    _selectedDate= await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
    ).whenComplete(() {
      setState(() {

      });
    });
    productObj.formattedDate=DateFormat("dd/MM/yyyy").format(_selectedDate!);
    productObj.timeStamp =_selectedDate!.millisecondsSinceEpoch;
    productObj.uploadedYear=_selectedDate!.year;
    productObj.uploadedMonth=_selectedDate!.month;

  }


  _saveProduct(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      if(_selectedDate==null) return;
      if(_imagePath==null) return;
      if(categoryDropDown==null) return;
      DBSQLiteHelper.insertNewProduct(productObj);
      print(productObj);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Product Name",
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return " Enter Product Name ";
                  }
                  if(value.length<=6){
                    return "Product Name must be 6 character";
                  }
                  return null;
                },
                onSaved: (value){
                productObj.name=value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                    labelText: "Enter Product Description",
                    border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return " Enter Product Description ";
                  }
                  if(value.length<=6){
                    return "Product Name must be 6 character";
                  }
                  return null;
                },
                onSaved: (value){
                    productObj.description=value;
                },
              ),
              SizedBox(
                height: 10
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Enter Product Price",
                    border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return " Price Cant be Empty ";
                  }
                  if(double.parse(value)<=0.0){
                    return "Provide a valid Price";
                  }
                  return null;
                },
                onSaved: (value){
                    productObj.price=double.parse(value!);

                },
              ),
              SizedBox(
                height: 20,
              ),
              Text("Select Purchase Date "),
              Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Text(_selectedDate==null?"No Choosen Date Yet":"${productObj.formattedDate}"),
                      OutlinedButton(onPressed:_openCalender, child: Text("SelectDate"))
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 8,
                child: Column(
                  children: [
                    Text("Select Category"),
                    DropdownButton(
                      value: categoryDropDown,
                        items: categoryList.map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item))).toList() ,
                        onChanged: (value){
                        setState(() {
                          categoryDropDown=value.toString();
                        });
                        productObj.category=categoryDropDown;
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Select Product Image"),
              ),
              Card(
                elevation: 8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Card(
                        elevation: 8,
                         child:_imagePath.isEmpty==true?Image.asset("images/pH.jpg"):Image.file(File(_imagePath)),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                              formCamera =true;
                            });
                            _takePhoto();
                          }, child: Text("Capture Image"),),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              formCamera =false;
                            });
                            _takePhoto();
                            }, child: Text("Select Form Gallery")),

                        ],
                      ),
                    )
                  ],
                ),
              ),

              Center(
                  child: ElevatedButton(
                  onPressed: (){
                    _saveProduct();
                    // print(_selectedDate);
                  },
                  child: Text("Save"),
                  )
              )


            ],
          ),
        ),
      ),
    );
  }
}
