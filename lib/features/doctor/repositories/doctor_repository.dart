import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medoc_patient_app/models/doctor_model.dart';

class DoctorRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Doctor>> getDoctors() {
    return _firestore.collection('doctors').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Doctor.fromMap(doc.data())).toList());
  }
}
