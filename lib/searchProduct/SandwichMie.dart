import 'package:softdevuas/searchProduct/searchpage.dart';

class SandwichMie extends Item {
  SandwichMie (String name, String imagePath, double price)
      : super(
          name,
          imagePath,
          price,
          description: 'Sandwich mie adalah hidangan yang menggabungkan mie dan roti sandwich. Biasanya, mie yang sudah dimasak dimasukkan ke dalam roti sandwich bersama dengan berbagai bahan tambahan seperti sayuran, daging, keju, dan saus.',
          variasi: ['Sayur sayuran + Mayonaise', 'Keju + Daging'],
        );
}