part of 'jenis_sampah_cubit.dart';

abstract class JenisSampahState extends Equatable {
  const JenisSampahState();
}

class JenisSampahInitial extends JenisSampahState {
  @override
  List<Object?> get props => [];
}

class JenisSampahLoaded extends JenisSampahState {
  final List<JenisSampahModel>? jenisSampahs;

  JenisSampahLoaded({this.jenisSampahs});
  
  @override
  List<Object?> get props => [jenisSampahs];
}
class JenisSampahLoadedFailed extends JenisSampahState {
  final String? message;

  JenisSampahLoadedFailed({this.message});
  
  @override
  List<Object?> get props => [message];
}
