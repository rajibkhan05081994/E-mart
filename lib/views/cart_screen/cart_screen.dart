import 'package:e_mart/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Our cart is empty".text.fontFamily(bold).color(darkFontGrey).makeCentered(),
    );
  }
}
