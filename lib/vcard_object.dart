// To parse this JSON data, do
//
//     final vcardObject = vcardObjectFromMap(jsonString);

import 'dart:convert';

class VcardObject {
  VcardObject({
    this.version,
    this.fn,
    this.n,
    this.nickname,
    this.bday,
    this.gender,
    this.categories,
    this.kind,
    this.lang,
    this.note,
    this.geo,
    this.photo,
    this.logo,
    this.org,
    this.role,
    this.title,
    this.tel,
    this.email,
    this.url,
    this.adr,
    this.rev,
  });

  String version;
  String fn;
  N n;
  String nickname;
  String bday;
  String gender;
  String categories;
  String kind;
  String lang;
  String note;
  Geo geo;
  Logo photo;
  Logo logo;
  String org;
  String role;
  String title;
  List<Tel> tel;
  List<Email> email;
  List<Url> url;
  List<Adr> adr;
  String rev;

  factory VcardObject.fromJson(String str) => VcardObject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VcardObject.fromMap(Map<String, dynamic> json) => VcardObject(
    version: json["VERSION"] == null ? null : json["VERSION"],
    fn: json["FN"] == null ? null : json["FN"],
    n: json["N"] == null ? null : N.fromMap(json["N"]),
    nickname: json["NICKNAME"] == null ? null : json["NICKNAME"],
    bday: json["BDAY"] == null ? null : json["BDAY"],
    gender: json["GENDER"] == null ? null : json["GENDER"],
    categories: json["CATEGORIES"] == null ? null : json["CATEGORIES"],
    kind: json["KIND"] == null ? null : json["KIND"],
    lang: json["LANG"] == null ? null : json["LANG"],
    note: json["NOTE"] == null ? null : json["NOTE"],
    geo: json["GEO"] == null ? null : Geo.fromMap(json["GEO"]),
    photo: json["PHOTO"] == null ? null : Logo.fromMap(json["PHOTO"]),
    logo: json["LOGO"] == null ? null : Logo.fromMap(json["LOGO"]),
    org: json["ORG"] == null ? null : json["ORG"],
    role: json["ROLE"] == null ? null : json["ROLE"],
    title: json["TITLE"] == null ? null : json["TITLE"],
    tel: json["TEL"] == null ? null : List<Tel>.from(json["TEL"].map((x) => Tel.fromMap(x))),
    email: json["EMAIL"] == null ? null : List<Email>.from(json["EMAIL"].map((x) => Email.fromMap(x))),
    url: json["URL"] == null ? null : List<Url>.from(json["URL"].map((x) => Url.fromMap(x))),
    adr: json["ADR"] == null ? null : List<Adr>.from(json["ADR"].map((x) => Adr.fromMap(x))),
    rev: json["REV"] == null ? null : json["REV"],
  );

  Map<String, dynamic> toMap() => {
    "VERSION": version == null ? null : version,
    "FN": fn == null ? null : fn,
    "N": n == null ? null : n.toMap(),
    "NICKNAME": nickname == null ? null : nickname,
    "BDAY": bday == null ? null : bday,
    "GENDER": gender == null ? null : gender,
    "CATEGORIES": categories == null ? null : categories,
    "KIND": kind == null ? null : kind,
    "LANG": lang == null ? null : lang,
    "NOTE": note == null ? null : note,
    "GEO": geo == null ? null : geo.toMap(),
    "PHOTO": photo == null ? null : photo.toMap(),
    "LOGO": logo == null ? null : logo.toMap(),
    "ORG": org == null ? null : org,
    "ROLE": role == null ? null : role,
    "TITLE": title == null ? null : title,
    "TEL": tel == null ? null : List<dynamic>.from(tel.map((x) => x.toMap())),
    "EMAIL": email == null ? null : List<dynamic>.from(email.map((x) => x.toMap())),
    "URL": url == null ? null : List<dynamic>.from(url.map((x) => x.toMap())),
    "ADR": adr == null ? null : List<dynamic>.from(adr.map((x) => x.toMap())),
    "REV": rev == null ? null : rev,
  };
}

class Adr {
  Adr({
    this.type,
    this.street,
    this.city,
    this.zipcode,
    this.country,
    this.region,
    this.postbox,
    this.extaddress,
    this.geo,
    this.label,
  });

  List<String> type;
  String street;
  String city;
  String zipcode;
  String country;
  String region;
  String postbox;
  String extaddress;
  Geo geo;
  String label;

  factory Adr.fromJson(String str) => Adr.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Adr.fromMap(Map<String, dynamic> json) => Adr(
    type: json["type"] == null ? null : List<String>.from(json["type"].map((x) => x)),
    street: json["street"] == null ? null : json["street"],
    city: json["city"] == null ? null : json["city"],
    zipcode: json["zipcode"] == null ? null : json["zipcode"],
    country: json["country"] == null ? null : json["country"],
    region: json["region"] == null ? null : json["region"],
    postbox: json["postbox"] == null ? null : json["postbox"],
    extaddress: json["extaddress"] == null ? null : json["extaddress"],
    geo: json["geo"] == null ? null : Geo.fromMap(json["geo"]),
    label: json["Label"] == null ? null : json["Label"],
  );

  Map<String, dynamic> toMap() => {
    "type": type == null ? null : List<dynamic>.from(type.map((x) => x)),
    "street": street == null ? null : street,
    "city": city == null ? null : city,
    "zipcode": zipcode == null ? null : zipcode,
    "country": country == null ? null : country,
    "region": region == null ? null : region,
    "postbox": postbox == null ? null : postbox,
    "extaddress": extaddress == null ? null : extaddress,
    "geo": geo == null ? null : geo.toMap(),
    "Label": label == null ? null : label,
  };
}

class Geo {
  Geo({
    this.latitude,
    this.longitude,
  });

  String latitude;
  String longitude;

  factory Geo.fromJson(String str) => Geo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };
}

class Email {
  Email({
    this.email,
    this.type,
  });

  String email;
  List<String> type;

  factory Email.fromJson(String str) => Email.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Email.fromMap(Map<String, dynamic> json) => Email(
    email: json["email"] == null ? null : json["email"],
    type: json["type"] == null ? null : List<String>.from(json["type"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "email": email == null ? null : email,
    "type": type == null ? null : List<dynamic>.from(type.map((x) => x)),
  };
}

class Logo {
  Logo({
    this.mediatype,
    this.uri,
    this.encoding,
  });

  String mediatype;
  String uri;
  String encoding;

  factory Logo.fromJson(String str) => Logo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Logo.fromMap(Map<String, dynamic> json) => Logo(
    mediatype: json["mediatype"] == null ? null : json["mediatype"],
    uri: json["uri"] == null ? null : json["uri"],
    encoding: json["encoding"] == null ? null : json["encoding"],
  );

  Map<String, dynamic> toMap() => {
    "mediatype": mediatype == null ? null : mediatype,
    "uri": uri == null ? null : uri,
    "encoding": encoding == null ? null : encoding,
  };
}

class N {
  N({
    this.firstname,
    this.middlename,
    this.lastname,
    this.prefix,
    this.suffix,
  });

  String firstname;
  String middlename;
  String lastname;
  String prefix;
  String suffix;

  factory N.fromJson(String str) => N.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory N.fromMap(Map<String, dynamic> json) => N(
    firstname: json["firstname"] == null ? null : json["firstname"],
    middlename: json["middlename"] == null ? null : json["middlename"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    prefix: json["prefix"] == null ? null : json["prefix"],
    suffix: json["suffix"] == null ? null : json["suffix"],
  );

  Map<String, dynamic> toMap() => {
    "firstname": firstname == null ? null : firstname,
    "middlename": middlename == null ? null : middlename,
    "lastname": lastname == null ? null : lastname,
    "prefix": prefix == null ? null : prefix,
    "suffix": suffix == null ? null : suffix,
  };
}

class Tel {
  Tel({
    this.telnr,
    this.type,
  });

  String telnr;
  List<String> type;

  factory Tel.fromJson(String str) => Tel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tel.fromMap(Map<String, dynamic> json) => Tel(
    telnr: json["telnr"] == null ? null : json["telnr"],
    type: json["type"] == null ? null : List<String>.from(json["type"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "telnr": telnr == null ? null : telnr,
    "type": type == null ? null : List<dynamic>.from(type.map((x) => x)),
  };
}

class Url {
  Url({
    this.uri,
    this.type,
  });

  String uri;
  List<String> type;

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> json) => Url(
    uri: json["uri"] == null ? null : json["uri"],
    type: json["type"] == null ? null : List<String>.from(json["type"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "uri": uri == null ? null : uri,
    "type": type == null ? null : List<dynamic>.from(type.map((x) => x)),
  };
}
