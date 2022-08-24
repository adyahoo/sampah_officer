part of 'models.dart';

class DaftarTransaksiModel extends Equatable {
  final int? id;
  final NasabahModel? nasabah;
  final UserModel? petugas;
  final AdminModel? admin;
  final double? totalBerat;
  final int? totalHarga;
  final String? tglTransaksi;
  final String? status;
  final int? isSampahEdited;

  DaftarTransaksiModel(
      {this.id,
      this.nasabah,
      this.petugas,
      this.admin,
      this.totalBerat,
      this.totalHarga,
      this.tglTransaksi,
      this.status,
      this.isSampahEdited});

  factory DaftarTransaksiModel.fromJson(Map<String, dynamic> data) =>
      DaftarTransaksiModel(
          id: data['id'],
          nasabah: NasabahModel.fromJson(data['nasabah']),
          petugas: UserModel.fromJson(data['petugas']),
          admin:
              data['admin'] != null ? AdminModel.fromJson(data['admin']) : null,
          totalBerat: data['total_berat'].toDouble(),
          totalHarga: data['total_harga'],
          tglTransaksi: data['tanggal_transaksi'],
          status: data['status'],
          isSampahEdited: data['is_sampah_edited']);

  @override
  List<Object?> get props => [
        id,
        nasabah,
        petugas,
        admin,
        totalBerat,
        totalHarga,
        tglTransaksi,
        status,
        isSampahEdited
      ];
}
