// import 'package:flutter/material.dart';
// import 'package:module_nine_assignment/home_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
//

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class Product {
  String image;
  String name;
  int unitPrice;
  String color;
  String size;
  int quantity;

  Product(this.image, this.name, this.unitPrice, this.color, this.size,
      this.quantity);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment Nine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products = [
    Product('images/images1.jpeg', 'Pullover', 51, 'Black', 'L', 1),
    Product('images/product2.jpeg', 'T-Shirt', 30, 'Gray', 'L', 1),
    Product('images/product2.jpeg', 'Sport Dress', 43, 'Black', 'M', 1),
  ];

  void increaseItemCount(int index) {
    setState(() {
      products[index].quantity++;
    });
  }

  void decreaseItemCount(int index) {
    if (products[index].quantity > 0) {
      setState(() {
        products[index].quantity--;
      });
    }
  }

  int calculateTotalAmount() {
    int total = 0;
    for (var product in products) {
      total += product.quantity * product.unitPrice;
    }
    return total;
  }

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF9F9F9),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 18, 0, 24),
            child: Text(
              "My Bag",
              style: TextStyle(
                fontSize: screenWidth > 600
                    ? 48
                    : 34, // Adjust font size for larger screens
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(products[index].image, fit: BoxFit.cover),
                        Expanded(
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(products[index].name),
                                const Icon(Icons.more_vert),
                              ],
                            ),
                            subtitle: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Color: ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${products[index].color}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: '  Size: ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${products[index].size}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFF9B9B9B),
                                              offset: Offset(0, 1),
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.white,
                                          shape: const CircleBorder(),
                                          child: InkWell(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            onTap: () =>
                                                decreaseItemCount(index),
                                            child: const Center(
                                              child: Icon(
                                                Icons.remove,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          '${products[index].quantity.toString()}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFF9B9B9B),
                                              offset: Offset(0, 1),
                                              blurRadius: 2,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.white,
                                          shape: const CircleBorder(),
                                          child: InkWell(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            onTap: () =>
                                                increaseItemCount(index),
                                            child: const Center(
                                              child: Icon(
                                                Icons.add,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${products[index].unitPrice * products[index].quantity}\$',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 105,
        elevation: 0,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${calculateTotalAmount().toStringAsFixed(0)}\$',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                MySnackBar(
                    "Congratulations, Your order has been placed Successfully!!",
                    context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 28),
                backgroundColor: const Color(0xffdb3022),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "CHECK OUT",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}