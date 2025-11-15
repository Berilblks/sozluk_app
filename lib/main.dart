import 'package:flutter/material.dart';
import 'package:sozluk_app/DetaySayfa.dart';
import 'package:sozluk_app/Kelimeler.dart';
import 'package:sozluk_app/KelimelerCevap.dart';
import 'package:sozluk_app/Kelimelerdao.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool arama = false;
  String aramaKelimesi = "";

  List<Kelimeler> parseKelimelerCevap(String cevap){
    return KelimelerCevap.fromJson(json.decode(cevap)).kelimelerListesi;
  }

  Future<List<Kelimeler>> tumKelimeler() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php");
    var cevap = await http.get(url);
    return parseKelimelerCevap(cevap.body);
  }

  Future<List<Kelimeler>> aramaYap(String aramaKelimesi) async{
    var kelimelerListesi = await Kelimelerdao().kelimeAra(aramaKelimesi);

    return kelimelerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: arama ?
            TextField(
              decoration: InputDecoration(hintText: "Aranacak kelimeyi yazınız"),
              onChanged: (aramaSonucu){
                print("Arama sonucu : $aramaSonucu");
                setState(() {
                  aramaKelimesi = aramaSonucu;
                });
              },
            )
            : Text("Sözlük Uygulaması", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          arama ?
          IconButton(
            onPressed: (){
              setState(() {
                arama = false;
                aramaKelimesi = "";
              });
            },
            icon: Icon(Icons.cancel),
          )
          : IconButton(
              onPressed: (){
                setState(() {
                  arama = true;
                });
              },
              icon: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<Kelimeler>>(
        future: arama ? aramaYap(aramaKelimesi) : tumKelimeler(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var kelimelerListesi = snapshot.data;
            return ListView.builder(
                itemCount: kelimelerListesi!.length,
                itemBuilder: (context,indeks){
                  var kelime = kelimelerListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(kelime: kelime)));
                    },
                    child: SizedBox(
                      height: 50,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(kelime.ingilizce, style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(kelime.turkce),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }
          else{
            return Center();
          }
        },

      ),

    );
  }
}
