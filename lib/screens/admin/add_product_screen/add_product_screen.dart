import 'package:e_commerce_app/widgets/form_input.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const routeName = '/add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              child: Column(
            children: [
              FormInput(
                labelText: 'Product Name',
              ),
              const SizedBox(
                height: 20,
              ),
              FormInput(
                labelText: 'Product Price',
              ),
              const SizedBox(
                height: 20,
              ),
              FormInput(
                labelText: 'Product Category',
              ),
              const SizedBox(
                height: 20,
              ),
              FormInput(
                maxLines: 3,
                labelText: 'Product Description',
              ),
            ],
          )),
        ),
      ),
    );
  }
}
