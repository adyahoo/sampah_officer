part of 'models.dart';

class JenisSampahModel extends Equatable {
  final int? id;
  final String? nama;
  final int? harga;
  final String? satuan;
  final int? isOrganik;

  JenisSampahModel(
      {this.id, this.nama, this.harga, this.isOrganik, this.satuan});

  factory JenisSampahModel.fromJson(Map<String, dynamic> data) =>
      JenisSampahModel(
          id: data['id'],
          nama: data['nama'],
          harga: data['harga'],
          satuan: data['satuan'],
          isOrganik: data['is_organik']);

  @override
  List<Object?> get props => [id, nama, harga, isOrganik, satuan];
}
