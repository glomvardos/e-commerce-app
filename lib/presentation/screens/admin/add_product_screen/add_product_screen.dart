import 'package:e_commerce_app/presentation/screens/admin/add_product_screen/widgets/add_product_form.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const routeName = '/add-product';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const AddProductForm();
  }
}
