import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampah_officer/data/models/models.dart';
import 'package:sampah_officer/data/services/services.dart';
import '../models/models.dart';
import 'cubit.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login(String telepon, String password) async {
    ApiReturnValue<UserModel> result =
        await UserService.login(telepon, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadedFailed(result.message));
    }
  }

  Future<void> logout() async {
    ApiReturnValue<UserModel> result = await UserService.logout();

    if (result.status == true) {
      emit(UserLoggedOut(result.message!));
    } else {
      emit(UserLoadedFailed(result.message));
    }
  }

  Future<void> getProfile() async {
    ApiReturnValue<UserModel> result = await UserService.getProfile();

    if (result.status == true) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadedFailed(result.message));
    }
  }

  Future<void> editProfile(
      String name, String bornDate, String phone, String gender, String address,
      {File? image}) async {
    ApiReturnValue<UserModel> result = await UserService.updateProfile(
        name, bornDate, phone, gender, address,
        image: image);

    if (result.status == true) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadedFailed(result.message));
    }
  }

  Future<void> changePassword(
      String oldPass, String newPass, String confNewPass) async {
    ApiReturnValue<String> result =
        await UserService.changePassword(oldPass, newPass, confNewPass);

    if (result.status == true) {
      emit(ChangePasswordSuccess(result.message));
    } else {
      emit(ChangePasswordFailed(result.message));
    }
  }
}
