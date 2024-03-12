import 'package:flutter/material.dart';
import 'package:flutter_frontend_tcc/page/Menu/SampleMenuItem.dart';
import 'package:flutter_frontend_tcc/page/ShoppingCart/ShoppingCart.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Cardápio Digital'),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFEFC226),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Home', icon: Icon(Icons.home)),
              Tab(text: 'Menu', icon: Icon(Icons.menu_book)),
              Tab(text: 'Pedidos', icon: Icon(Icons.restaurant_menu)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Conteúdo da página HomePage
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Olá, seja bem-vindo ao nosso,',
                      style: TextStyle(fontSize: 20)),
                  const Text('Cardápio Digital',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'Quem disse que felicidade não se compra, nunca viu o nosso cardápio.',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    'assets/images/home.png',
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  ElevatedButton(
                    child: Text('Acessar Menu'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondRoute(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEFC226),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Conteúdo da página CATS
            Center(
              child: SampleMenuItem(),
            ),
            // Conteúdo da página BIRDS
            const Center(
              child: ShoppingCart(),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
