import 'package:flutter/material.dart';
import 'package:helloworld/TelaInicial.dart';
import 'package:helloworld/TelaRelato.dart';
import 'Universidade.dart';

void main() {
  runApp(TelaHomePage());
}

class TelaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/detail': (context) => DetailPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSidebarOpen = false;

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  List<String> relatos = [
    'Relato 1',
    'Relato 2',
    'Relato 3',
    'Relato 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'UniSafe',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xFF2F4F4F),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: toggleSidebar,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xFFF2EFE8),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: relatos.length,
            itemBuilder: (context, index) {
              return Container(
                width: 342,
                height: 125,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    relatos[index],
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/detail',
                        arguments: relatos[index]);
                  },
                ),
              );
            },
          ),
          if (isSidebarOpen)
            Container(
              width: 250,
              color: Color(0xFFF2EFE8),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: toggleSidebar,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10),
                      Text(
                        'Gabriel José',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xFF979797),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 10),
                      Text(
                        'Unicap - Universida',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xFF979797),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 10),
                      Text(
                        'Configuração',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xFF979797),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10),
                      Text(
                        'Dados pessoais',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xFF979797),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaInicial(),
                        ),
                      ); // Implementar a lógica para o botão "Entrar"
                    }, // Implementar a lógica para o bot
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFC59F3F),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        'Sair',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TelaRelato())); // Ação do botão "Relatar"
        },
        backgroundColor: Color(0xFF2F4F4F),
        child: Icon(Icons.add),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String relato = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Relato'),
      ),
      body: Center(
        child: Text(
          relato,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
