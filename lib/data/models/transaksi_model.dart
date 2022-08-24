part of 'models.dart';

class TransaksiModel extends Equatable {
  final String? tglTransaksi;
  final List<DaftarTransaksiModel>? daftarTransaksi;

  TransaksiModel({this.daftarTransaksi, this.tglTransaksi});

  factory TransaksiModel.fromJson(Map<String, dynamic> data) => TransaksiModel(
      tglTransaksi: data['tanggal_transaksi'],
      daftarTransaksi: (data['daftar_transaksi'] as Iterable)
          .map((e) => DaftarTransaksiModel.fromJson(e))
          .toList());

  @override
  List<Object?> get props => [daftarTransaksi, tglTransaksi];
}
