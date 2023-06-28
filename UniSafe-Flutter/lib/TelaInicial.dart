import 'package:flutter/material.dart';
import 'package:helloworld/TelaEntrar.dart';
import 'TelaCadastro.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F4F4F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                'https://drive.google.com/uc?export=view&id=1hHxehNMc6yLgYDZ9dvq4HQi24xQ3lyiH',
                width: 70,
                height: 70,
              ),
            ),
            SizedBox(height: 66.25),
            SizedBox(
              width: 256,
              height: 79,
              child: Text(
                "Sinta-se mais seguro com a Unisafe",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.44,
                ),
              ),
            ),
            SizedBox(height: 66.25),
            SizedBox(
              width: 338,
              height: 59,
              child: Text(
                "Saiba em quais lugares ter atenção próximo a sua universidade e ajude colegas com seus relatos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 0.84,
                ),
              ),
            ),
            SizedBox(height: 66.25),
            Container(
              width: 325,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 325,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TelaEntrar()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFC59F3F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 66.25),
            Container(
              width: 325,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaCadastro()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Cadastre-se',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaInicial(),
  ));
}
