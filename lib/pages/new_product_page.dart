import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
class NewProductPage extends StatefulWidget {
  const NewProductPage({Key? key}) : super(key: key);
  static final routeName ='/new_product';
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final _formKey = GlobalKey<FormState>();
  _saveProduct(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
    }
  }
  var productObj = Product();
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
                height: 10,
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
                    print(productObj);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: ElevatedButton(
                  onPressed: _saveProduct,
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
