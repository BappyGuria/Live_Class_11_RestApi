import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:restapi/screen/add_new_product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> productList = [];

  bool inProgress = false;

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList() async {
    inProgress = true;
    Response response =
        await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        for (Map<String, dynamic> jesonData in responseData['data']) {
          productList.add(Product(
            jesonData['_id'],
            jesonData['ProductName'],
            jesonData['ProductCode'],
            jesonData['Img'],
            jesonData['Qty'],
            jesonData['UnitPrice'],
            jesonData['TotalPrice'],
          ));
        }
      }
      inProgress = false;
      print(productList.length);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              productList.clear();
              getProductList();
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Alert Dialog'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddNewProduct(),
                                      ),
                                    );
                                  },
                                  leading:
                                      Icon(Icons.drive_file_rename_outline),
                                  title: Text('Edit'),
                                ),
                                Divider(),
                                ListTile(
                                  onTap: () {
                                    productList.remove(productList[index]);

                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  leading: Icon(Icons.delete),
                                  title: Text('Delete'),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  leading: Image.network(
                    productList[index].Img,
                    width: 80,
                  ),
                  title: Text(productList[index].ProductName),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productList[index].ProductCode),
                          Text(productList[index].Qty)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${productList[index].UnitPrice} \$'),
                          Text('${productList[index].TotalPrice} \$')
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNewProduct()));
          },
          child: const Icon(Icons.add)),
    );
  }
}

class Product {
  final String _id;
  final String ProductName;
  final String ProductCode;
  final String Img;
  final String Qty;
  final String UnitPrice;
  final String TotalPrice;

  Product(this._id, this.ProductName, this.ProductCode, this.Img, this.Qty,
      this.UnitPrice, this.TotalPrice);
}
