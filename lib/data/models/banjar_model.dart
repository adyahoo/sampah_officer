part of 'models.dart';

class BanjarModel extends Equatable {
  final int? id;
  final String? kodeBanjar;
  final String? namaBanjar;

  BanjarModel({this.id, this.kodeBanjar, this.namaBanjar});

  factory BanjarModel.fromJson(Map<String, dynamic> data) => BanjarModel(
      id: data['id'],
      kodeBanjar: data['kode_banjar'],
      namaBanjar: data['nama_banjar']);

  @override
  List<Object?> get props => [id, kodeBanjar, namaBanjar];
}
