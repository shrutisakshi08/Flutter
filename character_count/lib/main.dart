import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:CharacterCountScreen(),
    );
  }
}

class CharacterCountScreen extends StatefulWidget {
  @override
  _CharacterCountScreenState createState()=>_CharacterCountScreenState();
}

class _CharacterCountScreenState extends State<CharacterCountScreen> {
 
  String _enteredText ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Character Count Function'),
      ),
      body:Padding(
        padding:EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            TextField(
              onChanged:(text) {
                setState(() {
                  _enteredText=text;
                });
              },
              decoration:InputDecoration(
                border:OutlineInputBorder(),
                labelText:'Enter text',
              ),
            ),
            SizedBox(height:20),
            Text(
              'Character Count: ${_enteredText.length}',
              style: TextStyle(fontSize:18),
            ),
          ],
        ),
      ),
    );
  }
}