import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Title'),
                    hintText: 'Enter product title',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Product code'),
                    hintText: 'Enter product code',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Image URL'),
                    hintText: 'Enter Image URL',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Quantity'),
                    hintText: 'Enter quantity title',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Price'),
                    hintText: 'Enter product price',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Total Price'),
                    hintText: 'Enter product total price',
                  ),
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                    hintText: 'Enter product description',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    onPressed: () {},
                    child: const Text('Add'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
