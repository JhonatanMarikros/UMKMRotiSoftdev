import 'package:softdevuas/searchProduct/searchpage.dart';

class RotiMie extends Item {
  RotiMie(String name, String imagePath, double price)
      : super(
          name,
          imagePath,
          price,
          description: 'Roti mie adalah makanan yang terbuat dari kombinasi roti dan mie. Roti mie biasanya diolah dengan cara memasukkan mie ke dalam adonan roti atau menggunakan roti sebagai pembungkus mie yang sudah dimasak.',
          variasi: ['Sayur sayuran + Mayonaise', 'Keju + Daging'],
        );
}