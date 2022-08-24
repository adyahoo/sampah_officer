part of 'models.dart';

class NasabahModel extends Equatable {
  final int? id;
  final String? nama;
  final int? idBanjar;
  final BanjarModel? banjar;
  final String? telepon;
  final String? tglLahir;
  final String? kodeNasabah;
  final String? jenisKelamin;
  final String? alamat;
  final int? saldo;
  final String? fotoProfil;
  static String? token;

  NasabahModel(
      {this.id,
      this.nama,
      this.telepon,
      this.tglLahir,
      this.alamat,
      this.jenisKelamin,
      this.fotoProfil,
      this.saldo,
      this.idBanjar,
      this.banjar,
      this.kodeNasabah});

  factory NasabahModel.fromJson(Map<String, dynamic> data) => NasabahModel(
        id: data['id'],
        nama: data['nama'],
        idBanjar: data['banjar_id'],
        banjar: BanjarModel.fromJson(data['banjar']),
        telepon: data['telepon'],
        tglLahir: data['tgl_lahir'],
        kodeNasabah: data['nomor_nasabah'],
        jenisKelamin: data['jenis_kelamin'],
        alamat: data['alamat'],
        saldo: data['saldo'],
        fotoProfil: data['foto_profil'],
      );

  @override
  List<Object?> get props => [
        id,
        nama,
        telepon,
        tglLahir,
        alamat,
        jenisKelamin,
        fotoProfil,
        saldo,
        idBanjar,
        kodeNasabah
      ];
}
