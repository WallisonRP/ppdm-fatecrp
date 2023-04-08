// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  FirebaseFirestore db = FirebaseFirestore.instance;

  saveStudentInFirebase(Map<String, dynamic> aluno) async {
    await db
        .collection('alunos')
        .doc('cursos')
        .collection('ads')
        .doc(aluno['turma'])
        .collection('alunos')
        .doc(aluno['ra'])
        .set(aluno);
  }

  saveStudentInAttendanceList(Map<String, dynamic> studentToSave) async {
    var test = await getDoc(studentToSave);

    if (test == true) {
      db
          .collection('listas_de_chamadas')
          .doc(studentToSave['materia'])
          .collection('aulas')
          .doc(studentToSave['data_chamada'])
          .collection('alunos_presentes')
          .doc(studentToSave["ra_aluno"])
          .set(studentToSave);
    } else {
      print("Precisa criar");
      db
          .collection('listas_de_chamadas')
          .doc(studentToSave['materia'])
          .collection('aulas')
          .doc(studentToSave['data_chamada'])
          .set({"data": studentToSave['data_chamada']});

      db
          .collection('listas_de_chamadas')
          .doc(studentToSave['materia'])
          .collection('aulas')
          .doc(studentToSave['data_chamada'])
          .collection('alunos_presentes')
          .doc(studentToSave["ra_aluno"])
          .set(studentToSave);
    }
  }

  Future getDoc(Map<String, dynamic> studentToSave) async {
    var a = await db
        .collection('listas_de_chamadas')
        .doc(studentToSave['materia'])
        .collection('aulas')
        .doc(studentToSave['data_chamada'])
        .get();
    //  var a = await db.collection('collection').document($name).get();
    if (a.exists) {
      print('Exists');
      return true;
    }
    if (!a.exists) {
      print('Not exists');
      return false;
    }
  }
}
