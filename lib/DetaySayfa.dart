import 'package:flutter/material.dart';
import 'package:sozluk_app/Kelimeler.dart';

class Detaysayfa extends StatefulWidget {

  Kelimeler kelime;


  Detaysayfa({required this.kelime});

  @override
  _DetaysayfaState createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Detay Sayfa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.kelime.ingilizce,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),),
            Text(widget.kelime.turkce,style: TextStyle(fontSize: 30, color: Colors.black),),
          ],
        ),
      ),

    );
  }
}
