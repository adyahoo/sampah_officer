part of 'transaksi_cubit.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();
}

class TransaksiInitial extends TransaksiState {
  @override
  List<Object?> get props => [];
}

class TransaksiLoaded extends TransaksiState {
  final List<TransaksiModel>? transaksis;

  TransaksiLoaded({this.transaksis});

  @override
  List<Object?> get props => [transaksis];
}

class TransaksiLoadedFailed extends TransaksiState {
  final String? message;

  TransaksiLoadedFailed({this.message});

  @override
  List<Object?> get props => [message];
}
