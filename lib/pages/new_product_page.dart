import 'package:flutter/material.dart';
class NewProductPage extends StatefulWidget {
  const NewProductPage({Key? key}) : super(key: key);
  static final routeName ='/new_product';
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
    );
  }
}
