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
}
