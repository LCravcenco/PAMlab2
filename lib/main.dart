import 'package:flutter/material.dart';
import 'dart:convert';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  int words_num = 0;

  void countWords() {
    var words = myController.text.split(' ');
    int count = 0;

    for (String word in words) {
      if (word.contains('a') || word.contains('A')) {
        count++;
        continue;
      }
    }

    setState(() {
      words_num = count;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration:
                  InputDecoration(labelText: 'Introduceti fraza'),
                  controller: myController,
                ),
                new SizedBox(height: 20.0),
                new ElevatedButton(
                  onPressed: () {
                    countWords();
                  },
                  child: Text('Verifica'),
                ),
                new SizedBox(height: 20.0),
                new Text(
                  'Numarul de cuvinte: $words_num',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            )));
  }
}

void main() => runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
        appBar: new AppBar(title: new Text('Verifica numarul de cuvinte cu litera A/a ')),
        body: new MyForm())));
