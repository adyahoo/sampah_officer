part of 'pages.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPassController = TextEditingController();
  TextEditingController _newPassController = TextEditingController();
  TextEditingController _confNewPassController = TextEditingController();

  void handleChangePassword() async {
    context.loaderOverlay.show();

    await context.read<UserCubit>().changePassword(_oldPassController.text,
        _newPassController.text, _confNewPassController.text);
    UserState state = context.read<UserCubit>().state;

    if (state is ChangePasswordSuccess) {
      context.loaderOverlay.hide();
      Get.back();
      snackbarSuccess(title: state.message);
    } else {
      context.loaderOverlay.hide();
      snackbarError(
          title: 'Terjadi Kesalahan',
          message: (state as ChangePasswordFailed).message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Ganti Password'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 100,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomInput(
                      textEditingController: _oldPassController,
                      hasLabel: true,
                      label: 'Password Lama',
                      isPassword: true,
                      hintText: 'Masukkan Password Lama',
                    ),
                    CustomInput(
                      textEditingController: _newPassController,
                      hasLabel: true,
                      label: 'Password Baru',
                      isPassword: true,
                      hintText: 'Masukkan Password Baru',
                    ),
                    CustomInput(
                      textEditingController: _confNewPassController,
                      hasLabel: true,
                      label: 'Konfirmasi Password Baru',
                      isPassword: true,
                      hintText: 'Masukkan Konfirmasi Password Baru',
                    ),
                  ],
                ),
                CustomButton(
                    title: 'Submit',
                    onPress: () {
                      if (_oldPassController.text.isEmpty ||
                          _newPassController.text.isEmpty ||
                          _confNewPassController.text.isEmpty) {
                        snackbarError(
                            title: 'Terjadi Kesalahan',
                            message: 'Mohon Lengkapi Seluruh Data');
                      } else {
                        handleChangePassword();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
