import 'package:flutter/material.dart';
import '../../widgets/grid_view.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;

  const MenuItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.0),
        child: const GridListMenuItems(type: GridListDemoType.footer),
      ),
    );
  }
}
