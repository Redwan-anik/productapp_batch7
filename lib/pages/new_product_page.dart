import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/product_model.dart';
class NewProductPage extends StatefulWidget {
  const NewProductPage({Key? key}) : super(key: key);
  static final routeName ='/new_product';
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final _formKey = GlobalKey<FormState>();
  var productObj = Product();
  DateTime?_selectedDate;

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
    productObj.uploadedYear=_selectedDate!.month;
    productObj.uploadedMonth=_selectedDate!.month;

  }


  _saveProduct(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
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
                height: 20,
              ),
              Text("Select Purchase Date "),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Text(_selectedDate==null?"No Choosen Date Yet":"${productObj.formattedDate}"),
                  OutlinedButton(onPressed:_openCalender, child: Text("SelectDate"))
                ],
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
