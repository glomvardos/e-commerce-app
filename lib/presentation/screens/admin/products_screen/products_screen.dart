import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product.dart';
import '../../../../data/repositories/products_repository.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ProductsRepository>().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }

        if (snapshot.hasData) {
          final products = snapshot.data as List<Product>;
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(products[index].name),
                subtitle: Text(products[index].price.toString()),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
