import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TelaRelato extends StatefulWidget {
  @override
  _TelaRelatoState createState() => _TelaRelatoState();
}

class _TelaRelatoState extends State<TelaRelato> {
  final TextEditingController _ocorridoController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _localizacaoController = TextEditingController();
  final TextEditingController dateInput = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _ocorridoController.dispose();
    _descricaoController.dispose();
    _localizacaoController.dispose();
    dateInput.dispose();
    super.dispose();
  }

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EFE8),
      appBar: AppBar(
        backgroundColor: Color(0xFF2F4F4F),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _showConfirmExitDialog(context);
          },
        ),
        title: Text('Relatar um problema'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estamos aqui para te ajudar',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              hint: Text('Selecione o ocorrido',
                  style: TextStyle(color: Colors.black)),
              value: null,
              items: [
                DropdownMenuItem<String>(
                  value: 'Furto ou Roubo',
                  child: Text('Furto ou Roubo',
                      style: TextStyle(color: Colors.black)),
                ),
                DropdownMenuItem<String>(
                  value: 'Agressão física',
                  child: Text('Agressão física',
                      style: TextStyle(color: Colors.black)),
                ),
                DropdownMenuItem<String>(
                  value: 'Movimentação perigosa',
                  child: Text('Movimentação perigosa',
                      style: TextStyle(color: Colors.black)),
                ),
                DropdownMenuItem<String>(
                  value: 'Assédio',
                  child: Text('Assédio', style: TextStyle(color: Colors.black)),
                ),
                DropdownMenuItem<String>(
                  value: 'Outros',
                  child: Text('Outros', style: TextStyle(color: Colors.black)),
                ),
              ],
              onChanged: (value) {
// Implemente a ação desejada ao selecionar uma opção
              },
            ),
            SizedBox(height: 20),
            Text(
              'Descrição do ocorrido:',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: dateInput,
              decoration: InputDecoration(
                hintText: "Data do ocorrido",
                filled: true,
                fillColor: Color(0x54d9d9d9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              hint: Text('Selecione a localização',
                  style: TextStyle(color: Colors.black)),
              value: null,
              items: [
                DropdownMenuItem<String>(
                  value: 'UFPE',
                  child: Text('UFPE', style: TextStyle(color: Colors.black)),
                ),
                DropdownMenuItem<String>(
                  value: 'UPE',
                  child: Text('UPE', style: TextStyle(color: Colors.black)),
                ),
                DropdownMenuItem<String>(
                  value: 'Unicap',
                  child: Text('Unicap', style: TextStyle(color: Colors.black)),
                ),
              ],
              onChanged: (value) {
// Implemente a ação desejada ao selecionar uma opção
              },
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showConfirmationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF2F4F4F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Relatar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Você deseja desistir do relato?',
              style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o alerta
              },
              child: Text('Não'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o alerta
                Navigator.pop(context); // Voltar à tela anterior
              },
              child: Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Você deseja concluir seu relato?',
              style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o alerta
              },
              child: Text('Voltar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o alerta
                _showSuccessDialog(context);
              },
              child: Text('Concluir'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Relato concluído com sucesso!',
              style: TextStyle(color: Colors.black)),
          content: Text('Deseja voltar para a tela principal?',
              style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(context,
                    ModalRoute.withName('/')); // Voltar à tela principal
              },
              child: Text('Voltar'),
            ),
          ],
        );
      },
    );
  }
}
