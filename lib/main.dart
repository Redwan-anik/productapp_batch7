import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:productapp_batch7/pages/home_Page.dart';
import 'package:productapp_batch7/pages/new_product_page.dart';
import 'package:productapp_batch7/pages/product_details_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        // routes{} this is  a map where NewProductPage.routeName is key and after (:) this is value
        //HomePage.routeName: (context) =>HomePage(),
        NewProductPage.routeName:(context)=>NewProductPage(),
        ProductDetailsPage.routeName:(context)=>ProductDetailsPage()
      },
    );
  }
}


