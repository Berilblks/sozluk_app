class Kelimeler {
  String kelime_id;
  String ingilizce;
  String turkce;

  Kelimeler(this.kelime_id, this.ingilizce, this.turkce);

  factory Kelimeler.fromJson(Map<String,dynamic> json) {
    return Kelimeler(json["kelime_id"], json["ingilizce"], json["turkce"]as String);
  }
}