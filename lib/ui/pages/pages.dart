import 'dart:developer';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sampah_officer/data/cubit/input_sampah_cubit.dart';
import 'package:sampah_officer/data/models/models.dart';
import 'package:sampah_officer/shared/shared.dart';
import 'package:sampah_officer/ui/widgets/widgets.dart';
import 'package:searchfield/searchfield.dart';

import '../../data/cubit/cubit.dart';
import '../../data/services/services.dart';

part 'add_sampah.dart';
part 'edit_sampah.dart';
part 'form_input_sampah.dart';
part 'main_page.dart';
part 'home_page.dart';
part 'profile_page.dart';
part 'login_page.dart';
part 'edit_profile_page.dart';
part 'change_password_page.dart';