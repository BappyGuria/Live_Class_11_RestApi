import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:restapi/screen/Product_List.dart';
import 'package:restapi/screen/add_new_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white
        )
      ),
      home: ProductList(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<Product> productList = [];
//
//   bool inProgress = false;
//
//   @override
//   void initState() {
//     getProduct();
//     super.initState();
//   }
//   void getProduct() async {
//     inProgress = true;
//
//     Response response =
//     await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
//
//     print(response.statusCode);
//     print(response.body);
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//       if (responseData['status'] == 'success') {
//         for (Map<String, dynamic> productJeson in responseData['data']) {
//           productList.add(Product(
//             productJeson['_id'] ?? '',
//             productJeson['ProductName'] ?? '',
//             productJeson['ProductCode'] ?? '',
//             productJeson['Img'] ?? '',
//             productJeson['UnitPrice'] ?? '',
//             productJeson['Qty'] ?? '',
//             productJeson['TotalPrice'] ?? '',
//           ));
//         }
//       }
//       print(productList.length);
//
//       setState(() {});
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddNewProduct(),
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: (){
//             productList.clear();
//             getProduct();
//
//             setState(() {
//
//             });
//           }, icon: Icon(Icons.refresh))
//         ],
//         title: const Text('Product List'),
//       ),
//       body: ProductList(productList: productList),
//     );
//   }
// }




