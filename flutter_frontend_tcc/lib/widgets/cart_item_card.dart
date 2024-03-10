import 'package:flutter/material.dart';

class CartItemCard extends StatefulWidget {
  final String productImage;
  final String productName;
  final double productPrice;
  int quantity = 1;

  CartItemCard(
      {required this.productImage,
      required this.productName,
      required this.productPrice});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // Reduce width to 50%
      child: Card(
        elevation: 7.0, // Add elevation for shadows
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color:
            Color.fromARGB(255, 255, 255, 255), // Set background color to white
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.productImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.productName,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => setState(() {
                          if (widget.quantity > 1) {
                            widget.quantity--;
                          }
                        }),
                      ),
                      Text('${widget.quantity}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => setState(() {
                          widget.quantity++;
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'R\$ ${(widget.quantity * widget.productPrice).toStringAsFixed(2)}',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
