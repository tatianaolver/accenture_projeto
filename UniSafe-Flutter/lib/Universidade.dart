import 'package:flutter/material.dart';
import 'TelaRelato.dart';

class Universidade extends StatefulWidget {
  @override
  _UniversidadeState createState() => _UniversidadeState();
}

class _UniversidadeState extends State<Universidade> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EFE8),
      appBar: AppBar(
        backgroundColor: Color(0xFFC59F3F),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nos ajude a te mostrar os alertas \n mais próximos da sua universidade!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  hint: Text('Selecione sua universidade'),
                  items: [
                    DropdownMenuItem<String>(
                      value: 'UFPE - Universidade Federal de Pernambuco',
                      child: Text('UFPE - Universidade Federal de Pernambuco'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'UPE - Universidade de Pernambuco',
                      child: Text('UPE - Universidade de Pernambuco'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'UNICAP - Universidade Católica de Pernambuco',
                      child:
                          Text('UNICAP - Universidade Católica de Pernambuco'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 80.25),
            Container(
              width: 315,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaRelato(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFC59F3F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Avançar',
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
          ],
        ),
      ),
    );
  }
}
