import 'package:flutter/material.dart';
import 'package:productapp_batch7/pages/new_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
    static final routeName ='/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context,NewProductPage.routeName),
        child: Icon(Icons.add),
      ),
    );
  }
}

