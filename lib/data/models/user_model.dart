part of 'models.dart';

@HiveType(typeId: 0)
class UserModel extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? nama;
  @HiveField(2)
  final String? telepon;
  @HiveField(3)
  final String? tglLahir;
  @HiveField(4)
  final String? alamat;
  @HiveField(5)
  final String? jenisKelamin;
  @HiveField(6)
  final String? fotoProfil;
  static String? token;

  UserModel(
      {this.id,
      this.nama,
      this.telepon,
      this.tglLahir,
      this.alamat,
      this.jenisKelamin,
      this.fotoProfil});

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
      id: data['id'],
      nama: data['nama'],
      telepon: data['telepon'],
      tglLahir: data['tgl_lahir'],
      alamat: data['alamat'],
      jenisKelamin: data['jenis_kelamin'],
      fotoProfil: data['foto_profil']);

  @override
  List<Object?> get props => [
        id,
        nama,
        telepon,
        tglLahir,
        alamat,
        jenisKelamin,
        fotoProfil,
      ];
}
