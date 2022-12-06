import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/product.dart';
import '../../../../../data/repositories/products_repository.dart';
import '../../../../widgets/form_input.dart';
import '../../../../widgets/primary_btn.dart';
import '../../../../../utils/toast_message.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  bool _isLoading = false;
  bool _autoValidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productCategoryController =
      TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _productDiscountController =
      TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _productPriceController.dispose();
    _productCategoryController.dispose();
    _productQuantityController.dispose();
    _productDiscountController.dispose();
    _productDescriptionController.dispose();
    super.dispose();
  }

  void _onAddNewProduct() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await context
          .read<ProductsRepository>()
          .createProduct(Product(
            name: _productNameController.text,
            price: double.parse(_productPriceController.text),
            category: _productCategoryController.text,
            quantity: int.parse(_productQuantityController.text),
            discount: int.parse(_productDiscountController.text),
            description: _productDescriptionController.text,
          ))
          .then((_) => {
                ToastMessage.success(
                  context,
                  'Product has been added',
                ),
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (route) => false,
                ),
              })
          .catchError((error) => {
                ToastMessage.error(context, error),
              });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        FormInput(
                          labelText: 'Product Name',
                          controller: _productNameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          labelText: 'Product Price',
                          controller: _productPriceController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          labelText: 'Product Category',
                          controller: _productCategoryController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          labelText: 'Product Quantity',
                          controller: _productQuantityController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          labelText: 'Product Discount',
                          controller: _productDiscountController,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormInput(
                          maxLines: 3,
                          controller: _productDescriptionController,
                          labelText: 'Product Description',
                        ),
                        const Spacer(),
                        PrimaryBtn(
                          text: 'Submit',
                          onClickHandler: _onAddNewProduct,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
