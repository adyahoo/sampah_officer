part of 'input_sampah_cubit.dart';

abstract class InputSampahState extends Equatable {
  const InputSampahState();
}

class InputSampahInitial extends InputSampahState {
  @override
  List<Object?> get props => [];
}

class InputSampahLoaded extends InputSampahState {
  final List<InputSampahModel> inputSampahs;

  InputSampahLoaded({this.inputSampahs = const []});

  @override
  List<Object?> get props => [inputSampahs];

  InputSampahLoaded copyWith({List<InputSampahModel>? inputSampahs}) =>
      InputSampahLoaded(inputSampahs: inputSampahs ?? this.inputSampahs);
}

class StoreSampahSuccess extends InputSampahState {
  final String? message;

  StoreSampahSuccess({this.message});

  @override
  List<Object?> get props => [message];
}

class StoreSampahFailed extends InputSampahState {
  final String? message;

  StoreSampahFailed({this.message});

  @override
  List<Object?> get props => [message];
}

class SetEditSampah extends InputSampahState {
  final InputSampahModel? sampah;
  final int? index;

  SetEditSampah(this.sampah, this.index);

  @override
  List<Object?> get props => [sampah, index];
}
