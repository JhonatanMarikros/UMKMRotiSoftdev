import 'package:softdevuas/searchProduct/searchpage.dart';

class MieKebab extends Item {
  MieKebab(String name, String imagePath, double price)
      : super(
          name,
          imagePath,
          price,
          description: 'Mie kebab adalah inovasi kuliner yang menggabungkan mie dengan elemen kebab',
          variasi: ['Mie Kebab Ayam', 'Mie Kebab Ikan', 'Mie Kebab Tofu'],
        );
}