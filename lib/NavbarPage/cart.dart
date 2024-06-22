import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:softdevuas/searchProduct/searchpage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class Cart with ChangeNotifier {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;

  Cart._internal();

  final List<Item> _items = [];
  final Map<Item, int> _itemQuantities = {};

  List<Item> get items => _items;

  void addItem(Item item) {
    if (_itemQuantities.containsKey(item)) {
      _itemQuantities[item] = _itemQuantities[item]! + 1;
    } else {
      _itemQuantities[item] = 1;
      _items.add(item);
    }
    notifyListeners(); // Notify all listeners about state change.
  }

  void removeItem(Item item) {
    if (_itemQuantities.containsKey(item)) {
      _itemQuantities[item] = _itemQuantities[item]! - 1;
      if (_itemQuantities[item]! <= 0) {
        _items.remove(item);
        _itemQuantities.remove(item);
      }
    }
    notifyListeners(); // Notify all listeners about state change.
  }

  int getItemQuantity(Item item) {
    return _itemQuantities[item] ?? 0;
  }

  int getTotalQuantity() {
    int totalQuantity = 0;
    _itemQuantities.forEach((item, quantity) {
      totalQuantity += quantity;
    });
    return totalQuantity;
  }

  Map<String, double> calculateTotalPrice() {
    double originalPrice = 0.0;
    double discountedPrice = 0.0;
    for (var item in _items) {
      originalPrice += (item.price * (_itemQuantities[item] ?? 0));
    }
    discountedPrice = originalPrice;

    final now = DateTime.now();
    if (now.hour >= 20 && now.hour < 24) {
      discountedPrice *= 0.5;
    } else if (originalPrice >= 200.000) {
      discountedPrice *= 0.9; // Apply 10% discount for purchases over Rp. 200.000
    }
    return {'originalPrice': originalPrice, 'discountedPrice': discountedPrice};
  }

  void resetCart() {
    _items.clear();
    _itemQuantities.clear();
    notifyListeners();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Text(
                          item.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Text('Jumlah ${cart.getItemQuantity(item)}'),
                    ),
                  ],
                ),
                subtitle: Text('Harga: ${_formatCurrency(item.price)}'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(item.imagePath),
                  radius: 30,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        cart.removeItem(item);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        cart.addItem(item);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            _showPurchaseDialog(
                context,
                Provider.of<Cart>(context, listen: false)
                    .calculateTotalPrice());
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color.fromARGB(255, 150,75,0),),
          ),
          child: Text(
            'Buy',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  String _formatCurrency(double price) {
    final priceFormat = NumberFormat('#,###.000', 'id_ID');
    final formattedPrice = priceFormat.format(price);

    final parts = formattedPrice.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    return '$integerPart.$decimalPart';
  }

  void _showPurchaseDialog(BuildContext context, Map<String, double> prices) {
  double originalPrice = prices['originalPrice']!;
  double discountedPrice = prices['discountedPrice']!;
  final now = DateTime.now();
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String? selectedPaymentMethod;
      String senderNumber = '';
      String recipientName = '';

      return StatefulBuilder(
        builder: (context, setState) {
          String discountMessage;
          if (now.hour >= 20 && now.hour < 24) {
            discountMessage = 'Anda mendapatkan diskon 50% karena membeli di atas jam 8 malam sampai jam 12 malam';
          } else if (originalPrice >= 200.000) {
            discountMessage = 'Anda mendapatkan diskon 10% karena total pembelian mencapai Rp. 200.000 atau lebih!';
          } else {
            discountMessage = '';
          }

          return AlertDialog(
            title: Text('Konfirmasi Pembayaran'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Harga: ${_formatCurrency(originalPrice)}'),
                  if (discountMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        discountMessage,
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (discountedPrice < originalPrice)
                    Text('Total Harga Setelah Diskon: ${_formatCurrency(discountedPrice)}'),
                  SizedBox(height: 16),
                  Text(
                    'Pilih Metode Pembayaran:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  RadioListTile<String>(
                    title: ListTile(
                      leading: Image.asset('image/BCA.png', width: 40, height: 40),
                      title: Text('Bank BCA'),
                    ),
                    value: 'BCA',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: ListTile(
                      leading: Image.asset('image/BRI.png', width: 40, height: 40),
                      title: Text('Bank BRI'),
                    ),
                    value: 'BRI',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: ListTile(
                      leading: Image.asset('image/Ovo.png', width: 40, height: 40),
                      title: Text('E-Wallet OVO'),
                    ),
                    value: 'OVO',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: ListTile(
                      leading: Image.asset('image/Gopay.jpg', width: 40, height: 40),
                      title: Text('E-Wallet GoPay'),
                    ),
                    value: 'GoPay',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Nomor Pengirim'),
                    onChanged: (value) {
                      senderNumber = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Nama Penerima'),
                    onChanged: (value) {
                      recipientName = value;
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (selectedPaymentMethod != null &&
                      senderNumber.isNotEmpty &&
                      recipientName.isNotEmpty) {
                    Navigator.of(context).pop();
                    _showPaymentDetailsDialog(context, selectedPaymentMethod!,
                        discountedPrice, senderNumber, recipientName);
                  } else {
                    // Tampilkan pesan jika ada informasi yang belum diisi
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Silahkan lengkapi semua informasi terlebih dahulu')),
                    );
                  }
                },
                child: Text('Confirm'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    },
  );
}





  void _showPaymentDetailsDialog(BuildContext context, String paymentMethod,
      double totalPrice, String senderNumber, String recipientName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String paymentDetails;
        if (paymentMethod == 'BCA') {
          paymentDetails =
              'Bank: Bank BCA\nNomor Rekening: 1234567890\nNama Penerima: UMKM Roti';
        } else if (paymentMethod == 'BRI') {
          paymentDetails =
              'Bank: Bank BRI\nNomor Rekening: 1234567890\nNama Penerima: UMKM Roti';
        } else if (paymentMethod == 'OVO') {
          paymentDetails =
              'E-Wallet: OVO\nNomor Akun: 081234567890\nNama Penerima: UMKM Roti';
        } else if (paymentMethod == 'GoPay') {
          paymentDetails =
              'E-Wallet: GoPay\nNomor Akun: 081234567891\nNama Penerima: UMKM Roti';
        } else {
          paymentDetails = 'Informasi Pembayaran Tidak Diketahui';
        }

        return AlertDialog(
          title: Text('Detail Pembayaran'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Harga: ${_formatCurrency(totalPrice)}'),
                SizedBox(height: 16),
                Text(
                  'Detail Pembayaran:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(paymentDetails),
                SizedBox(height: 16),
                Text(
                  'Nomor Pengirim: $senderNumber\nNama Penerima: $recipientName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Setelah melakukan pembayaran, silakan konfirmasi pembayaran Anda.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                print('Pembayaran Berhasil');
                Navigator.of(context).pop();
                _showSuccessDialog(context);
                Provider.of<Cart>(context, listen: false).resetCart();
              },
              child: Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pembayaran Berhasil'),
          content: Text('Terima Kasih Telah Membeli'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
