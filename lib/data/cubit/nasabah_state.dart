part of 'nasabah_cubit.dart';

abstract class NasabahState extends Equatable {
  const NasabahState();
}

class NasabahInitial extends NasabahState {
  @override
  List<Object?> get props => [];
}

class NasabahLoaded extends NasabahState {
  final List<NasabahModel>? nasabahs;

  NasabahLoaded({this.nasabahs});
  
  @override
  List<Object?> get props => [nasabahs];
}

class NasabahLoadedFailed extends NasabahState {
  final String? message;

  NasabahLoadedFailed({this.message});
  
  @override
  List<Object?> get props => [message];
}
