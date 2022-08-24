part of 'models.dart';

class InputSampahModel extends Equatable {
  final int? jenis_sampah_id;
  final String? namaJenis;
  final double? berat;

  InputSampahModel({this.jenis_sampah_id, this.namaJenis, this.berat});

  @override
  List<Object?> get props => [jenis_sampah_id, namaJenis, berat];
}
