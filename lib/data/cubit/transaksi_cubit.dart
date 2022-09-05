import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:sampah_officer/data/models/models.dart';
import 'package:sampah_officer/data/services/services.dart';

part 'transaksi_state.dart';

class TransaksiCubit extends Cubit<TransaksiState> {
  TransaksiCubit() : super(TransaksiInitial());

  Future<void> getTransaksi() async {
    ApiReturnValue<List<TransaksiModel>> result =
        await TransaksiService.getTransaksi();

    List<TransaksiModel> empty = [];

    if (result.status == true) {
      emit(TransaksiLoaded(transaksis: result.value));
    } else {
      emit(TransaksiLoadedFailed(message: result.message));
    }
  }
}
