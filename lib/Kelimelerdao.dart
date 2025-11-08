import 'package:sozluk_app/Kelimeler.dart';
import 'package:sozluk_app/VeritabaniYardimcisi.dart';

class Kelimelerdao {

  Future<List<Kelimeler>> tumKelimeler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Kelimeler");
    
    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kelimeler(satir["kelime_id"], satir["ingilizce"], satir["turkce"]);
    });
  }

  Future<List<Kelimeler>> kelimeAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Kelimeler WHERE ingilizce like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kelimeler(satir["kelime_id"], satir["ingilizce"], satir["turkce"]);
    });
  }
}