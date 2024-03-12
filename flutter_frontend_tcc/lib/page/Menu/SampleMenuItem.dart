import 'package:flutter/material.dart';

class SampleMenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // Wrap the entire LayoutBuilder in Center
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                // Wide screen: Use Row for side-by-side layout
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text title
                    Container(
                      width: 350, // Adjust width as needed
                      child: Text(
                        "Mix de Folhas com Frango",
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    // Image with bowl
                    Expanded(
                      child: Stack(
                        children: [
                          // Bowl
                          Container(
                            width: 400,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 20,
                            child: Container(
                              width: 350,
                              height: 350,
                              child: Image.asset(
                                'images/image_menu_item2.png', // Replace with your image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                // Narrow screen: Use Column for vertical layout
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text title
                    Container(
                      width: double.infinity, // Extend to full width
                      child: Text(
                        "Mix de Folhas com Frango",
                        style: TextStyle(fontSize: 6),
                      ),
                    ),
                    // Image with bowl
                    Container(
                      width: double.infinity, // Extend to full width
                      child: Stack(
                        children: [
                          // Bowl
                          Container(
                            width: 400,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          // Salad
                          Positioned(
                            top: 30,
                            left: 20,
                            child: Container(
                              width: 350,
                              height: 350,
                              child: Image.asset(
                                'images/image_menu_item2.png', // Replace with your image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
