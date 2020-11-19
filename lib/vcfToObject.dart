import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'simple_vcard_parser.dart';
import 'vcard_object.dart';
//import 'package:localstorage/localstorage.dart';

String db_kontakte = 'kontakte';

class VcardObjectList {
  List<VcardObject> livco;

  VcardObjectList() {
    livco = new List();
  }

  toMap() {
    return livco.map((vco) {
      return vco.toMap();
    }).toList();
  }
}


class VcfToObject {
  String vcf;
  VcardObject vco;

  VcfToObject(this.vcf){
    convert();
  }

  String getMD5(){
    var bytes = utf8.encode(vco.toMap().toString());
    Digest md5Result = md5.convert(bytes);
    return md5Result.toString();
  }

  @override
  String toString() {
    return vco.toMap().toString();
  }

  void convert() {
    vco = VcardObject();
    var vc = VCardParser(vcf);

    vco.version = vc.version;
    vco.fn = vc.formattedName;
    final n = vc.name;
    if(n[0].isNotEmpty || n[1].isNotEmpty){
      vco.n = N(firstname: n[1], middlename: n[2],lastname: n[0],prefix: n[3], suffix: n[4]);
    }
    vco.nickname = vc.nickName;
    vco.bday = vc.birthDay;
    vco.categories = vc.categories;
    vco.org = vc.organisation;
    vco.title = vc.title;
    vco.role = vc.position;
    vco.gender = vc.gender;
    vco.note = vc.note;
    vco.rev = vc.revision;
    final geo = vc.geo;
    if(geo.isNotEmpty) {
      vco.geo = Geo(latitude: geo[0] , longitude: geo[1]) ;
    }
    var url = vc.typedURL;
    //print(url);
    if(url.length > 0){
      List<Url> list = [];
      Url newval;
      for (int i=0; i < url.length; i++){
        newval = Url(uri: url[i][0] , type:  url[i][1]);
        list.add(newval);
      }
      vco.url = list;
    }
    var email = vc.typedEmail;
    //print(email);
    if(email.length > 0){
      List<Email> list = [];
      Email newval;
      for (int i=0; i < email.length; i++){
        newval = Email(email: email[i][0] , type:  email[i][1]);
        list.add(newval);
      }
      vco.email = list;
    }
    var tel = vc.typedTelephone;
    //print(tel);
    if(tel.length > 0){
      List<Tel> list = [];
      Tel newval;
      for (int i=0; i < tel.length; i++){
        newval = Tel(telnr: tel[i][0] , type:  tel[i][1]);
        list.add(newval);
      }
      vco.tel = list;
    }
    var adr = vc.typedAdress;
    //print(adr);
    if(adr.length > 0) {
      List<Adr> list = [];
      var ladr;
      Adr newval;
      for (int i = 0; i < adr.length; i++) {
        ladr = adr[i][0];
        newval = Adr(street: ladr[2],
            city: ladr[3],
            zipcode: ladr[5],
            country: ladr[6],
            region: ladr[4],
            postbox: ladr[0],
            extaddress: ladr[1],
            type: adr[i][1]);
        list.add(newval);
      }
      vco.adr = list;
    }
  } // convert
}