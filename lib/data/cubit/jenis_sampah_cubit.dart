import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sampah_officer/data/models/models.dart';
import 'package:sampah_officer/data/services/services.dart';

part 'jenis_sampah_state.dart';

class JenisSampahCubit extends Cubit<JenisSampahState> {
  JenisSampahCubit() : super(JenisSampahInitial());

  Future<void> getJenisSampah() async {
    ApiReturnValue<List<JenisSampahModel>> result =
        await CommonService.getJenisSampah();

    if (result.status == true) {
      emit(JenisSampahLoaded(jenisSampahs: result.value));
    } else {
      emit(JenisSampahLoadedFailed(message: result.message));
    }
  }
}
