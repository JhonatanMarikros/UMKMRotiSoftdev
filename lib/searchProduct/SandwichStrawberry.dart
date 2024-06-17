import 'package:softdevuas/searchProduct/searchpage.dart';

class SandwichStrawberry extends Item {
  SandwichStrawberry(String name, String imagePath, double price)
      : super(
          name,
          imagePath,
          price,
          description: 'Sandwich stroberi klasik adalah hidangan manis yang terdiri dari roti tawar lembut yang diisi dengan irisan stroberi segar dan krim kocok manis.',
          variasi: ['Sandwich Stroberi dengan Keju Krim', 'Sandwich Stroberi dengan Yogurt', 'Sandwich Stroberi dengan Mint'],
        );
}