import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sampah_officer/data/models/models.dart';
import 'package:sampah_officer/data/services/services.dart';

part 'input_sampah_state.dart';

class InputSampahCubit extends Cubit<InputSampahState> {
  InputSampahCubit() : super(InputSampahLoaded());

  void inputSampah(int jenisSampah, double berat, String namaJenis) {
    InputSampahModel result = InputSampahModel(
        jenis_sampah_id: jenisSampah, berat: berat, namaJenis: namaJenis);
    List<InputSampahModel> newValue = [];
    if (state is InputSampahLoaded) {
      newValue.addAll((state as InputSampahLoaded).inputSampahs);
    }
    newValue.add(result);

    emit(InputSampahLoaded(inputSampahs: newValue));
  }

  void emptySampah() {
    List<InputSampahModel> newValue = [];

    emit(InputSampahLoaded(inputSampahs: newValue));
  }

  void editSampah(int jenisSampah, double berat, String namaJenis, int index) {
    InputSampahModel result = InputSampahModel(
        jenis_sampah_id: jenisSampah, berat: berat, namaJenis: namaJenis);
    List<InputSampahModel> newValue = [];
    if (state is InputSampahLoaded) {
      newValue.addAll((state as InputSampahLoaded).inputSampahs);
    }
    newValue[index] = result;

    emit(InputSampahLoaded(inputSampahs: newValue));
  }

  Future<void> storeSampah(
      int nasabahId, List<InputSampahModel> sampahs) async {
    if (nasabahId == null || sampahs.length == 0) {
      emit(StoreSampahFailed(message: 'Mohon Tambah Data Sampah'));
    }

    ApiReturnValue<String> result =
        await InputSampahService.storeSampah(nasabahId, sampahs);

    if (result.status == true) {
      emit(StoreSampahSuccess(message: result.message));
    } else {
      emit(StoreSampahFailed(message: result.message));
    }
  }
}
