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
          .collection('turnos')
          .doc(studentToSave['turno'])
          .collection('aulas')
          .doc(studentToSave['data_chamada'])
          .collection('alunos_presentes')
          .doc(studentToSave["ra_aluno"])
          .set(studentToSave);
    } else {
      db
          .collection('listas_de_chamadas')
          .doc(studentToSave['materia'])
          .collection('turnos')
          .doc(studentToSave['turno'])
          .set({"turno": studentToSave['turno']});

      db
          .collection('listas_de_chamadas')
          .doc(studentToSave['materia'])
          .collection('turnos')
          .doc(studentToSave['turno'])
          .collection('aulas')
          .doc(studentToSave['data_chamada'])
          .set({"data": studentToSave['data_chamada']});

      db
          .collection('listas_de_chamadas')
          .doc(studentToSave['materia'])
          .collection('turnos')
          .doc(studentToSave['turno'])
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
    if (a.exists) {
      return true;
    }
    if (!a.exists) {
      return false;
    }
  }
}
