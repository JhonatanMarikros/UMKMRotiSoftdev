import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:softdevuas/NavbarPage/cart.dart';
import 'package:softdevuas/NavbarPage/likes.dart';
import 'package:softdevuas/searchProduct/SandwichEsKrim.dart';
import 'package:softdevuas/searchProduct/MieKebab.dart';
import 'package:softdevuas/searchProduct/Esgoreng.dart';
import 'package:softdevuas/searchProduct/SandwichSalmon.dart';
import 'package:softdevuas/searchProduct/SandwichMie.dart';
import 'package:softdevuas/searchProduct/SandwichStrawberry.dart';
import 'package:softdevuas/searchProduct/RotiMie.dart';
import 'package:softdevuas/searchProduct/MieBurger.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  //List Barang
  final List<Item> _dataList = [
    Esgoreng("Es Krim Goreng", "image/1.png", 12.0),
    RotiMie("Roti Mie", "image/2.png", 8.0),
    SandwichMie("Sandwich Mie", "image/3.png", 15.0),
    SandwichSalmon("Sandwich Salmon", "image/4.png", 30.0),
    SandwichEsKrim("Sandwich Es Krim", "image/5.png", 13.0),
    MieBurger("Mie Burger", "image/6.png", 20.0),
    MieKebab("Mie Kebab", "image/7.png", 17.0),
    SandwichStrawberry("Sandwich Strawberry", "image/8.png", 25.0),
  ];

  //Memfilter daftar barang berdasarkan nama sesuai dengan input pencarian
  void _filterList(String searchQuery) {
    //diupdate setiap kata-kata berubah
    _filteredDataList.clear();
    if (searchQuery.isEmpty) {
      //diupdate setiap kata-kata berubah
      _filteredDataList.addAll(_dataList);
    } else {
      _dataList.forEach((item) {
        if (item.name.toLowerCase().contains(searchQuery.toLowerCase())) {
          //diupdate setiap kata-kata berubah
          _filteredDataList.add(item);
        }
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredDataList.addAll(_dataList);
  }

  List<Item> _filteredDataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        foregroundColor: Colors.white,
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterList(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDataList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(item: _filteredDataList[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: Hero(
                        tag: 'hero-tag-${_filteredDataList[index].name}',
                        child: Container(
                          width:
                              60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  _filteredDataList[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      title: Text(_filteredDataList[index].name),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String name;
  final String imagePath;
  final double price;
  final String description;
  final List<String> variasi;

  Item(
    this.name,
    this.imagePath,
    this.price, {
    required this.description,
    required this.variasi,
  });
}

class DetailPage extends StatelessWidget {
  final Item item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat('#,###.000', 'en_US');
    final formattedPrice = priceFormat.format(item.price);

    // Membagi harga yang diformat menjadi bagian bilangan bulat dan desimal
    final parts = formattedPrice.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.red.shade600,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'hero-tag-${item.name}',
                child: Container(
                  width:
                      160.0, // Double the radius for equivalent area coverage
                  height: 160.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.zero, // Ensuring no rounding
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                item.name,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Harga: $integerPart.$decimalPart',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add to Cart logic
                      final cart = Cart();
                      cart.addItem(item);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added to Cart'),
                        ),
                      );
                    },
                    child: const Text('Add to Cart'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red.shade600),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Consumer<Likes>(builder: (context, likes, child) {
                    return IconButton(
                      onPressed: () {
                        likes.toggleLike(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              likes.likedItems.contains(item)
                                  ? 'Added to Likes'
                                  : 'Removed from Likes',
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        likes.likedItems.contains(item)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            likes.likedItems.contains(item) ? Colors.red : null,
                      ),
                    );
                  })
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Variasi:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item.variasi.map((feature) {
                      return Text(
                        '- $feature',
                        style: const TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
