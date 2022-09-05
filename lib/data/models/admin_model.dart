part of 'models.dart';

class AdminModel extends Equatable {
  final int? id;
  final String? nama;
  final String? email;
  final String? tglLahir;
  final String? jenisKelamin;
  final String? alamat;
  final String? fotoProfil;

  AdminModel(
      {this.id,
      this.nama,
      this.email,
      this.tglLahir,
      this.jenisKelamin,
      this.alamat,
      this.fotoProfil});

  factory AdminModel.fromJson(Map<String, dynamic> data) => AdminModel(
      id: data['id'],
      nama: data['nama'],
      email: data['email'],
      tglLahir: data['tgl_lahir'],
      jenisKelamin: data['jenis_kelamin'],
      alamat: data['alamat'],
      fotoProfil: data['foto_profil']);

  factory AdminModel.commentJson(Map<String, dynamic> data) => AdminModel(
        id: data['id'],
        nama: data['nama'],
      );

  @override
  List<Object?> get props =>
      [id, nama, email, tglLahir, jenisKelamin, alamat, fotoProfil];
}
