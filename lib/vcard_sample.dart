String s04 = '''
BEGIN:VCARD
VERSION:4.0
CATEGORIES:neue Kategorie für Kontakt

FN:FirstName MiddleName LastName
N:LastName;FirstName;MiddleName;;
NICKNAME:nickname
BDAY:20201111
GENDER:M

NOTE:hier kommen die Notizen

ORG:ActivSpaces Labs
TITLE:Software Developer
ROLE:Org Pos

EMAIL:forrestgump@example.com
EMAIL;type=HOME:email 
EMAIL;type=WORK:work emial
EMAIL;type=OTHER:ohter email

TEL;TYPE=work,voice;VALUE=uri:tel:+1-111-555-1212
TEL;VALUE=uri;TYPE="voice,home":tel:Arbeits phone
TEL;VALUE=uri;TYPE="voice,work":tel:Work Phone Number
TEL;VALUE=uri;TYPE="voice,other":tel:other phone
TEL;VALUE=uri;TYPE=home:tel:+33-01-23-45-67
TEL;TYPE=home,voice;VALUE=uri:tel:+1-404-555-1212

ADR;TYPE=home,pref:Postfach;;Strasse;Ort;Region;PLZ;Germany
ADR;TYPE=home,intl:;;strasse;Ort;rgeion;PLZ;Germany
ADR;TYPE=home:posf;;stra;ort;region;plz;Germany
ADR;TYPE=WORK;PREF=1;LABEL="100 Waters Edge\nBaytown\, LA 30314\nUnited States of America":;;100 Waters Edge;Baytown;LA;30314;United States of America
ADR;TYPE=HOME;LABEL="42 Plantation St.\nBaytown\, LA 30314\nUnited States of America":;;42 Plantation St.;Baytown;LA;30314;United States of America
ADR;GEO="geo:12.3457,78.910";LABEL="Mr. John Q. Public, Esq.\n
      Mail Drop: TNE QB\n123 Main Street\nAny Town, CA  91921-1234\n
      U.S.A.":;;123 Main Street;Any Town;CA;91921-1234;U.S.A.

GEO3:50.858,7.0885  ;//2.1, 3.0
GEO:geo: 50.858\,7.0885

URL:https://github.com/valerycolong
URL;TYPE=HOME:web privat
URL;TYPE=OTHER:url_sonstig

NOTE:Notes on contact

REV:2020-11-11T16:28:05.189591
END:VCARD
''';

String s03 = '''
BEGIN:VCARD
VERSION:3.0
CATEGORIES:neue Kategorie für Kontakt

FN:FirstName MiddleName LastName
N:LastName;FirstName;MiddleName;;
NICKNAME:nickname
BDAY:20201111
GENDER:M

NOTE:hier kommen die Notizen

ORG:ActivSpaces Labs
TITLE:Software Developer
ROLE:Org Pos

EMAIL:forrestgump@example.com
EMAIL;type=HOME:email 
EMAIL;type=WORK:work emial
EMAIL;type=OTHER:ohter email

TEL;TYPE=cell:Telefon mobil
TEL;TYPE=CELL,HOME:(0170) 1234567
TEL;TYPE=VOICE,HOME:+4141310xxyy

ADR;TYPE=home,pref:Postfach;;Strasse;Ort;Region;PLZ;Germany
ADR;TYPE=home,intl:;;strasse;Ort;rgeion;PLZ;Germany
ADR;TYPE=home:posf;;stra;ort;region;plz;Germany

GEO:50.858,7.0885
GEO4:geo: 50.858\,7.0885  ;// 4.0

URL:https://github.com/valerycolong
URL;TYPE=HOME:web privat
URL;TYPE=OTHER:url_sonstig

NOTE:Notes on contact

REV:2020-11-11T16:28:05.189591
END:VCARD
''';

String s2 ='''BEGIN:VCARD
VERSION:3.0
ADR;TYPE=home,pref:Postfach;;Strasse;Ort;Region;PLZ;Germany
ADR;TYPE=home,intl:;;strasse;Ort;rgeion;PLZ;Germany
ADR;TYPE=home:posf;;stra;ort;region;plz;Germany
BDAY:2020-11-12
EMAIL;TYPE=HOME:email_privat
EMAIL;TYPE=WORK:email_dienstl
EMAIL;TYPE=OTHER:email_weitere
FN:Herr Vorname zwischen Nachname Jun.
N:Nachname;Vorname;zwischen;Herr;Jun.
NICKNAME:Spitzname
NOTE:hier kommen die Notizen
ORG:Organisation;Abteilung
TEL;TYPE=HOME:Telefon privat
TEL;TYPE=CELL:Telefon mobil
TEL;TYPE=HOME:Telefon tel
TEL;TYPE=HOME,VOICE:Telfon vice
TEL;TYPE=VIDEO:telefon video
TITLE:Titel Org
UID:f6e5de4f-fa8a-486b-898d-2e9ca4ceab85
URL;TYPE=HOME:web privat
URL;TYPE=HOME:web privat
URL:web auswählen
X-KADDRESSBOOK-CRYPTOPROTOPREF:openpgp/mime
X-KADDRESSBOOK-X-Anniversary:2020-11-11
X-KADDRESSBOOK-X-AssistantsName:Name Assistent
X-KADDRESSBOOK-X-ManagersName:Name Manager
X-KADDRESSBOOK-X-Office:Büro
X-KADDRESSBOOK-X-Profession:Beruf
X-KADDRESSBOOK-X-SpousesName:Name Partner
END:VCARD
''';

String s1 = '''BEGIN:VCARD
VERSION:3.0
PRODID:-//Thunderbird.net/NONSGML Thunderbird CardBook V46.1//DE
UID:80b696e0-d299-41ff-a8ab-9b7fe055f28b
CATEGORIES:neue Kategorie für Kontakt
FN:präfix Vorname weiterer Name Nachname suffix Spitzname Organisatieon
N:Nachname;Vorname;weiterer Name;präfix;suffix
NICKNAME:Spitzname
BDAY:20201112
TITLE:Org Titel
ROLE:Org Pos
ORG:Organisatieon
ITEM1.EMAIL:email_zuhause@local.de
ITEM1.X-ABLABEL:zuhause
EMAIL;TYPE=OTHER:weiter_email@locahlhost.de
TEL;TYPE=MAIN:tel_festnetz
TEL;TYPE=CELL:tel_mobil
TEL;TYPE=OTHER:tel_sonstig
ADR;TYPE=HOME:;;strasse;ort;region;PLZ;Germany
ADR;TYPE=WORK:;;strasse auf Arbeit;Ort;Region;PLZ;Germany
ITEM2.ADR:postfach dep;zus dep;strasse;ort;Region;PLZ;Germany
ITEM2.X-ABLABEL:sonstig
URL;TYPE=OTHER:url_sonstig
ITEM3.URL:eigene_url
ITEM3.X-ABLABEL:zweite_url
NOTE:notizen notizen notzien notizen notizen notzien notizen notizen notzie
 n notizen notizen notzien notizen notizen notzien notizen notizen notzien 
 notizen notizen notzien notizen notizen notzien notizen notizen notzien no
 tizen notizen notzien notizen notizen notzien notizen notizen notzien noti
 zen notizen notzien notizen notizen notzien notizen notizen notzien notize
 n notizen notzien notizen notizen notzien notizen notizen notzien
REV:2020-11-11T18:55:58Z
ITEM4.X-ABDATE:20201111
ITEM4.X-ABLABEL:Termin 11.11
X-THUNDERBIRD-ETAG:"904e76bd42e9933023a82e9806058fcf"
END:VCARD
  ''';


String s = '''BEGIN:VCARD
VERSION:3.0
PRODID:-//Sabre//Sabre VObject 4.3.0//EN
UID:b0ca17f1-f2f6-4fc9-b6e0-608f78179d2f
FN:Kontakt 1
N:;;;;
NICKNAME:contact_1_nickname
GENDER:O
TITLE:Title 1
ORG:Company 1
EMAIL;TYPE=HOME:contact _1@localhost.de
EMAIL;TYPE=OTHER:contact_1@localhost.de
EMAIL;TYPE=HOME:contact_1@localhost.de
TEL;TYPE=HOME:home_phone
ADR;TYPE=HOME:post office box;extended address;adsress;city;state;postal co
de;country
REV:20201101T125013Z
X-SOCIALPROFILE;TYPE=OTHER:https://social
END:VCARD
  ''';

String vs = '''BEGIN:VCARD
VERSION:4.0
N:Gump;Forrest;;Mr.;
FN:Forrest Gump
ORG:Bubba Gump Shrimp Co.
TITLE:Shrimp Man
PHOTO;MEDIATYPE=image/gif:http://www.example.com/dir_photos/my_photo.gif
TEL;TYPE=work,voice;VALUE=uri:tel:+1-111-555-1212
TEL;TYPE=home,voice;VALUE=uri:tel:+1-404-555-1212
ADR;TYPE=WORK;PREF=1;LABEL="100 Waters Edge\nBaytown\, LA 30314\nUnited States of America":;;100 Waters Edge;Baytown;LA;30314;United States of America
ADR;TYPE=HOME;LABEL="42 Plantation St.\nBaytown\, LA 30314\nUnited States of America":;;42 Plantation St.;Baytown;LA;30314;United States of America
EMAIL:forrestgump@example.com
GENDER:M
REV:20080424T195243Z
x-qq:21588891
END:VCARD''';

String s3 = '''BEGIN:VCARD
VERSION:3.0
PRODID:-//Sabre//Sabre VObject 4.3.0//EN
UID:8a531931-e165-426b-9e60-c871eafa432b
CATEGORIES:neue Kategorie für Kontakt
FN:neuer kontakt
N:;;;;
NICKNAME:nickname
BDAY:20201111
GENDER:U
TITLE:title
ORG:compay
EMAIL;TYPE=HOME:home_email
EMAIL;TYPE=WORK:work_email
EMAIL;TYPE=OTHER:other_email
EMAIL;TYPE=OTHER:other_email_2
TEL;TYPE=HOME:home_phone
TEL;TYPE=WORK:work_phone
TEL;TYPE=CELL:mobile_phone
ITEM1.TEL:work_mobile_phone
ITEM1.X-ABLABEL:WORK
ITEM2.TEL:home_phone
ITEM2.X-ABLABEL:HOME
TEL;TYPE=FAX:fax_phone
TEL:voice_phone
ADR;TYPE=HOME:post_office_box;ext_address;address;city;state_or_province;pl
 z;country
ADR;TYPE=WORK:post_office_box;ext_address;address;city;state_or_province;pl
 z;country
ITEM3.ADR:post_office_box;ext_address;address;city;state_or_province;plz;co
 untry
ITEM3.X-ABLABEL:OTHER
URL;TYPE=WORK:url_work
URL;TYPE=HOME:url_privat
URL;TYPE=OTHER:url_other
NOTE:notes
GEO:geo:90.000\,0.000
REV:2020-11-12T10:29:34Z
TZ:Europe/Berlin
X-ANNIVERSARY;VALUE=DATE:20201111
CLOUD;TYPE=HOME:federated_cloud_id
END:VCARD
''';
