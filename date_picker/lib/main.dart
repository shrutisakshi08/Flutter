import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:'Date Picker',
      home:MyHomePage(title:'Date Picker'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}):super(key:key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate=DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked=await showDatePicker(
      context: context,
      initialDate:selectedDate,
      firstDate:DateTime(2015, 8),
      lastDate:DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate=picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body:Padding(
        padding:const EdgeInsets.all(16.0),
        child:Center(
          child:Column(
            mainAxisSize:MainAxisSize.min,
            children:<Widget>[
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style:TextStyle(
                  fontSize:24.0,
                  fontWeight:FontWeight.w600,
                  color:Colors.deepPurple,
                ),
              ),
              const SizedBox(height:30.0),
              ElevatedButton(
                onPressed: ()=>_selectDate(context),
                style:ElevatedButton.styleFrom(
                  backgroundColor:Colors.white, 
                  padding:const EdgeInsets.symmetric(horizontal:30.0, vertical:12.0),
                  textStyle:const TextStyle(
                    fontSize:18,
                  ),
                ),
                child:const Text('Select Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}