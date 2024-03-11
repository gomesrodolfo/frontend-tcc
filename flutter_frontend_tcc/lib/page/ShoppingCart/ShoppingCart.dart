import 'package:flutter/material.dart';
import 'package:flutter_frontend_tcc/widgets/cart_footer.dart';
import 'package:flutter_frontend_tcc/widgets/cart_item_card.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pedidos')),
      body: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        child: Center(
          child: SpacedItemsList(),
        ),
      ),
      bottomNavigationBar: CartFooter(
        drinksTitle: 'Bebidas',
        drinks: [
          Text('Coca-Cola - R\$ 5.00'),
          Text('Suco de Laranja - R\$ 7.50'),
        ],
        foodTitle: 'Comidas',
        food: [
          Text('Pizza Margherita - R\$ 25.00'),
          Text('Salada Caesar - R\$ 15.00'),
        ],
        totalPrice: 76.50, // Substitua pelo cálculo real do preço total
        onConfirmPressed: () {
          // Adicione a lógica que será executada quando o botão for pressionado
          print('Pedido Confirmado!');
        },
      ),
    );
  }
}

class SpacedItemsList extends StatelessWidget {
  const SpacedItemsList({Key? key});

  @override
  Widget build(BuildContext context) {
    const items = 3;

    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              items,
              (index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: CartItemCard(
                        productName: 'Spaghetti a Bolonhesa',
                        productPrice: 29.00,
                        productImage: 'assets/images/image_menu_item2.png',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }
}

void onConfirmPressed() {
  // Crie um objeto para armazenar os dados do pedido
  final order = {
    'drinks': ['Coca-cola zero 350ml'],
    'food': ['Spaghetti a Bolonhesa'],
    'totalPrice': 29.00,
  };

  // Exiba os dados do pedido no console
  print('Pedido: $order');

  var context;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Pedido Confirmado!'),
      content: Text('Seu pedido foi enviado com sucesso.'),
      actions: [
        TextButton(
          child: Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: CartItemCard(
            productName: 'Spaghetti a Bolonhesa',
            productPrice: 29.00,
            productImage: 'assets/images/image_menu_item2.png',
          ),
        ),
        CartFooter(
          drinksTitle: 'Bebidas',
          drinks: [
            Text('Coca-Cola - R\$ 5.00'),
            Text('Suco de Laranja - R\$ 7.50'),
          ],
          foodTitle: 'Comidas',
          food: [
            Text('Pizza Margherita - R\$ 25.00'),
            Text('Salada Caesar - R\$ 15.00'),
          ],
          totalPrice: 76.50, // Substitua pelo cálculo real do preço total
          onConfirmPressed: () {
            // Adicione a lógica que será executada quando o botão for pressionado
            print('Pedido Confirmado!');
          },
        ),
      ],
    );
  }
}
