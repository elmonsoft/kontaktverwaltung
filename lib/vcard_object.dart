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
    version: json["VERSION"],
    fn: json["FN"],
    n: N.fromMap(json["N"]),
    nickname: json["NICKNAME"],
    bday: json["BDAY"],
    gender: json["GENDER"],
    categories: json["CATEGORIES"],
    kind: json["KIND"],
    lang: json["LANG"],
    note: json["NOTE"],
    geo: Geo.fromMap(json["GEO"]),
    photo: Logo.fromMap(json["PHOTO"]),
    logo: Logo.fromMap(json["LOGO"]),
    org: json["ORG"],
    role: json["ROLE"],
    title: json["TITLE"],
    tel: List<Tel>.from(json["TEL"].map((x) => Tel.fromMap(x))),
    email: List<Email>.from(json["EMAIL"].map((x) => Email.fromMap(x))),
    url: List<Url>.from(json["URL"].map((x) => Url.fromMap(x))),
    adr: List<Adr>.from(json["ADR"].map((x) => Adr.fromMap(x))),
    rev: json["REV"],
  );

  Map<String, dynamic> toMap() => {
    "VERSION": version,
    "FN": fn,
    "N": n.toMap(),
    "NICKNAME": nickname,
    "BDAY": bday,
    "GENDER": gender,
    "CATEGORIES": categories,
    "KIND": kind,
    "LANG": lang,
    "NOTE": note,
    "GEO": geo.toMap(),
    "PHOTO": photo.toMap(),
    "LOGO": logo.toMap(),
    "ORG": org,
    "ROLE": role,
    "TITLE": title,
    "TEL": List<dynamic>.from(tel.map((x) => x.toMap())),
    "EMAIL": List<dynamic>.from(email.map((x) => x.toMap())),
    "URL": List<dynamic>.from(url.map((x) => x.toMap())),
    "ADR": List<dynamic>.from(adr.map((x) => x.toMap())),
    "REV": rev,
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
    type: List<String>.from(json["type"].map((x) => x)),
    street: json["street"],
    city: json["city"],
    zipcode: json["zipcode"],
    country: json["country"],
    region: json["region"],
    postbox: json["postbox"],
    extaddress: json["extaddress"],
    geo: Geo.fromMap(json["geo"]),
    label: json["Label"],
  );

  Map<String, dynamic> toMap() => {
    "type": List<dynamic>.from(type.map((x) => x)),
    "street": street,
    "city": city,
    "zipcode": zipcode,
    "country": country,
    "region": region,
    "postbox": postbox,
    "extaddress": extaddress,
    "geo": geo.toMap(),
    "Label": label,
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
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
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
    email: json["email"],
    type: List<String>.from(json["type"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "type": List<dynamic>.from(type.map((x) => x)),
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
    mediatype: json["mediatype"],
    uri: json["uri"],
    encoding: json["encoding"],
  );

  Map<String, dynamic> toMap() => {
    "mediatype": mediatype,
    "uri": uri,
    "encoding": encoding,
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
    firstname: json["firstname"],
    middlename: json["middlename"],
    lastname: json["lastname"],
    prefix: json["prefix"],
    suffix: json["suffix"],
  );

  Map<String, dynamic> toMap() => {
    "firstname": firstname,
    "middlename": middlename,
    "lastname": lastname,
    "prefix": prefix,
    "suffix": suffix,
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
    telnr: json["telnr"],
    type: List<String>.from(json["type"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "telnr": telnr,
    "type": List<dynamic>.from(type.map((x) => x)),
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
    uri: json["uri"],
    type: List<String>.from(json["type"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "uri": uri,
    "type": List<dynamic>.from(type.map((x) => x)),
  };
}
