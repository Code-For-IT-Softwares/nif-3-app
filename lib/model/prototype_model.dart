// To parse this JSON data, do
//
//     final prototypeModel = prototypeModelFromJson(jsonString);

class Prototype {
    final String id;
    final String registrationid;
    final String phoneno;
    final String whatsappno;
    final String email;
    final String teamname;
    final String leadername;
    final List<String> membersname;
    final String collegename;
    final String city;
    final String state;
    final String projecttheme;
    final String projectdescription;
    final String uniqueness;
    final String projectimage;
    final String idcardimage;
    final String datetime;

  Prototype({
    required this.id,
    required this.registrationid,
    required this.phoneno,
    required this.whatsappno,
    required this.email,
    required this.teamname,
    required this.leadername,
    required this.membersname,
    required this.collegename,
    required this.city,
    required this.state,
    required this.projecttheme,
    required this.projectdescription,
    required this.uniqueness,
    required this.projectimage,
    required this.idcardimage,
    required this.datetime,
  });
}


List<Prototype> PrototypeData = [
  Prototype(id: 'id1', registrationid: 'registrationid1', phoneno: 'phoneno', whatsappno: 'whatsappno', email: 'email', teamname: 'teamname', leadername: 'Strength', membersname: ['membersname','membersname','membersname','membersname'], collegename: 'collegename', city: 'city', state: 'state', projecttheme: 'projecttheme', projectdescription: 'projectdescription', uniqueness: 'uniqueness', projectimage: 'projectimage', idcardimage: 'idcardimage', datetime: 'datetime'),
  Prototype(id: 'id2', registrationid: 'registrationid2', phoneno: 'phoneno', whatsappno: 'whatsappno', email: 'email', teamname: 'teamname', leadername: 'Strength', membersname: ['membersname','membersname','membersname','membersname'], collegename: 'collegename', city: 'city', state: 'state', projecttheme: 'projecttheme', projectdescription: 'projectdescription', uniqueness: 'uniqueness', projectimage: 'projectimage', idcardimage: 'idcardimage', datetime: 'datetime'),
  Prototype(id: 'id3', registrationid: 'registrationid3', phoneno: 'phoneno', whatsappno: 'whatsappno', email: 'email', teamname: 'teamname', leadername: 'Strength', membersname: ['membersname','membersname','membersname','membersname'], collegename: 'collegename', city: 'city', state: 'state', projecttheme: 'projecttheme', projectdescription: 'projectdescription', uniqueness: 'uniqueness', projectimage: 'projectimage', idcardimage: 'idcardimage', datetime: 'datetime'),
  Prototype(id: 'id4', registrationid: 'registrationid4', phoneno: 'phoneno', whatsappno: 'whatsappno', email: 'email', teamname: 'teamname', leadername: 'Strength', membersname: ['membersname','membersname','membersname','membersname'], collegename: 'collegename', city: 'city', state: 'state', projecttheme: 'projecttheme', projectdescription: 'projectdescription', uniqueness: 'uniqueness', projectimage: 'projectimage', idcardimage: 'idcardimage', datetime: 'datetime'),
];