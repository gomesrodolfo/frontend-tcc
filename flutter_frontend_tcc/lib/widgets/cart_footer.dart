import 'package:flutter/material.dart';

class CartFooter extends StatelessWidget {
  final String drinksTitle;
  final List<Widget> drinks;
  final String foodTitle;
  final List<Widget> food;
  final double totalPrice;
  final void Function() onConfirmPressed;

  const CartFooter({
    required this.drinksTitle,
    required this.drinks,
    required this.foodTitle,
    required this.food,
    required this.totalPrice,
    required this.onConfirmPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(thickness: 1.0, color: Colors.grey),
            _buildRow(drinksTitle, 'R\$ ${calculateDrinksPrice(drinks)}'),
            _buildListView(drinks),
            _buildRow(foodTitle, 'R\$ ${calculateFoodPrice(food)}'),
            _buildListView(food),
            _buildRow('Total', 'R\$ ${totalPrice.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: onConfirmPressed,
              child: Text('Realizar Pedido'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.4,
                    40), // Ajuste conforme necessário
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Ajuste conforme necessário
                ),
                elevation:
                    8.0, // Ajuste conforme necessário para a intensidade da sombra
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.bold)),
          ),
          Flexible(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: items,
        ),
      ),
    );
  }

  double calculateDrinksPrice(List<Widget> drinks) {
    return _calculateTotalPrice(drinks);
  }

  double calculateFoodPrice(List<Widget> food) {
    return _calculateTotalPrice(food);
  }

  double _calculateTotalPrice(List<Widget> items) {
    double totalPrice = 0.0;
    for (var item in items) {
      if (item is Text) {
        totalPrice += parsePrice(item.data!.substring(3));
      }
    }
    return totalPrice;
  }

  double parsePrice(String priceString) {
    try {
      return double.parse(priceString);
    } catch (e) {
      print("Erro ao converter preço: $e");
      return 0.0;
    }
  }
}
