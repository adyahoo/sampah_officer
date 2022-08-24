import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sampah_officer/data/models/models.dart';
import 'package:sampah_officer/data/services/services.dart';

part 'nasabah_state.dart';

class NasabahCubit extends Cubit<NasabahState> {
  NasabahCubit() : super(NasabahInitial());

  Future<void> getNasabah() async {
    ApiReturnValue<List<NasabahModel>> result =
        await CommonService.getNasabah();

    if (result.status == true) {
      emit(NasabahLoaded(nasabahs: result.value));
    } else {
      emit(NasabahLoadedFailed(message: result.message));
    }
  }
}
