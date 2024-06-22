import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:softdevuas/Product/EsGoreng.dart';
import 'package:softdevuas/Product/MieBurger.dart';
import 'package:softdevuas/Product/SandwichMie.dart';
import 'package:softdevuas/Product/SandwichEsKrim.dart';
import 'package:softdevuas/Product/MieKebab.dart';
import 'package:softdevuas/Product/SandwichSalmon.dart';
import 'package:softdevuas/Product/RotiMie.dart';
import 'package:softdevuas/Product/SandwichStrawberry.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> assetImages = [
    'image/banner.jpg',
    'image/banner2.jpg',
    'image/banner3.jpg',
    'image/banner4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        //ScrollWidget
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Profile Card
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 150,75,0),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('image/profil.png'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                              30.0), // Anda dapat mengganti nilai 16.0 dengan nilai margin yang Anda inginkan
                          child: const Text(
                            'Dart Bread',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Banner
              Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: CarouselSlider(
                  items: assetImages.map((assetPath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              assetPath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200.0,
                    initialPage: 0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //Product
              Container(
                margin: const EdgeInsets.only(right: 295, bottom: 10, top: 10),
                child: const Text(
                  "Produk",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SafeArea(
                  child: Container(
                margin: const EdgeInsets.fromLTRB(21, 0, 0, 0),
                child: Column(
                  children: [
                    //Row 1
                    //Product Row 1
                    Row(
                      children: [
                        //Product 1
                        Container(
                          width: 170,
                          height: 170,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Esgoreng()),
                                  );
                                },
                                child: Image.asset(
                                  'image/1.png',
                                  width: 180,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Es Krim Goreng',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Rp. 12.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '219 terjual',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        //Product 2
                        Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RotiMie()),
                                  );
                                },
                                child: Image.asset(
                                  'image/2.png',
                                  width: 200,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Roti Mie',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Rp. 8.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '102 terjual',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //Row 2
                    //Product Row 2
                    Row(
                      children: [
                        //Product 3
                        Container(
                          width: 170,
                          height: 170,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SandwichMie()),
                                  );
                                },
                                child: Image.asset(
                                  'image/3.png',
                                  width: 180,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Sandwich Mie',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Rp. 15.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '189 terjual',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        //Product 4
                        Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SandwichSalmon()),
                                  );
                                },
                                child: Image.asset(
                                  'image/4.png',
                                  width: 180,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Sandwich Salmon',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Rp. 30.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '401 terjual',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    //Row 3
                    //Product Row 3
                    Row(
                      children: [
                        //Product 5
                        Container(
                          width: 170,
                          height: 170,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SandwichEsKrim()),
                                  );
                                },
                                child: Image.asset(
                                  'image/5.png',
                                  width: 180,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Sandwich Es Krim',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Rp. 13.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '219 terjual',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        //Product 6
                        Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MieBurger()),
                                  );
                                },
                                child: Image.asset(
                                  'image/6.png',
                                  width: 180,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Mie Burger',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Rp. 20.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '411 terjual',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    //Row 4
                    //Product Row 4
                    Row(
                      children: [
                        //Product 7
                        Container(
                          width: 170,
                          height: 170,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MieKebab()),
                                  );
                                },
                                child: Image.asset(
                                  'image/7.png',
                                  width: 180,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Mie Kebab',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Rp. 17.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '120 terjual',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        //Product 8
                        Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SandwichStrawberry()),
                                  );
                                },
                                child: Image.asset(
                                  'image/8.png',
                                  width: 180,
                                  height: 90,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Sandwich Strawberry',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Rp. 25.000',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '610 terjual',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  //Widget yang membuat page baru dari masing-masing kategori.
  Widget _buildCategoryCard(
      String judul, IconData ikon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              ikon,
              size: 30,
              color: Colors.red.shade600,
            ),
            SizedBox(height: 8),
            Text(
              judul,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

//informasi kategori untuk title dan icon CategoryModel
class CategoryModel {
  final String title;
  final IconData icon;
  //membuat instance CategoryModel dengan title dan icon
  CategoryModel(this.title, this.icon);
}
