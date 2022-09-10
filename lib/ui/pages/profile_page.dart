part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getProfile();

    void handleLogout() async {
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Yakin Ingin Keluar Dari Aplikasi?',
                textAlign: TextAlign.center,
                style: primaryBoldTextStyle.copyWith(fontSize: 16),
              ),
              actions: [
                CustomButton(
                  title: 'Tidak',
                  onPress: () {
                    Get.back();
                  },
                ),
                CustomButton(
                  title: 'Iya',
                  isPrimary: false,
                  onPress: () async {
                    context.loaderOverlay.show();

                    await context.read<UserCubit>().logout();
                    UserState state = context.read<UserCubit>().state;

                    if (state is UserLoggedOut) {
                      context.loaderOverlay.hide();
                      snackbarSuccess(title: "Logout Berhasil");
                      Get.offAll(() => LoginPage());
                    } else {
                      context.loaderOverlay.hide();
                      snackbarError(
                          title: "Logout Gagal, " +
                              (state as UserLoadedFailed).message!);
                    }
                  },
                ),
              ],
            );
          });
    }

    return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => (state is UserLoaded)
            ? Scaffold(
                appBar: CustomAppbar(
                    title: 'Profile',
                    hasBack: false,
                    hasIcon: true,
                    onIconPress: () async {
                      Get.to(() => EditProfilePage(
                            user: state.user,
                          ))?.then((value) {
                        setState(() {});
                      });
                    }),
                body: ListView(
                  children: [
                    Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //image profile
                            Center(
                              child: Container(
                                width: 108,
                                height: 108,
                                margin: EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: (state.user!.fotoProfil != null)
                                            ? NetworkImage(baseUrlImg +
                                                state.user!.fotoProfil!)
                                            : AssetImage(
                                                'assets/images/profile.png',
                                              ) as ImageProvider,
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            //user information
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 28),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SectionTitle(title: 'Info Profil'),
                                    SizedBox(height: 30),
                                    Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(bottom: 24),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 100,
                                                  child: Text('Nama',
                                                      style:
                                                          normalBoldTextStyle)),
                                              Expanded(
                                                flex: 1,
                                                child: Text(state.user!.nama!,
                                                    style: normalBoldTextStyle,
                                                    softWrap: true),
                                              ),
                                            ])),
                                    Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(bottom: 24),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 100,
                                                  child: Text('Alamat',
                                                      style:
                                                          normalBoldTextStyle)),
                                              Expanded(
                                                flex: 1,
                                                child: Text(state.user!.alamat!,
                                                    style: normalBoldTextStyle,
                                                    softWrap: true),
                                              ),
                                            ])),
                                    Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(bottom: 24),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 100,
                                                  child: Text('Telepon',
                                                      style:
                                                          normalBoldTextStyle)),
                                              Text(state.user!.telepon!,
                                                  style: normalBoldTextStyle),
                                            ])),
                                  ],
                                )),
                            CustomDivider(),
                            //setting section
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    vertical: 38, horizontal: 28),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SectionTitle(title: 'Setting'),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => ChangePasswordPage())
                                            ?.then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 70,
                                              alignment: Alignment.centerLeft,
                                              child: Icon(
                                                Icons.change_circle_outlined,
                                                size: 32,
                                                color: primaryColor,
                                              )),
                                          Text('Ganti Password',
                                              style: normalBoldTextStyle)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    GestureDetector(
                                      onTap: () => handleLogout(),
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 70,
                                              alignment: Alignment.centerLeft,
                                              child: Image.asset(
                                                  'assets/images/logout.png',
                                                  width: 32,
                                                  height: 28,
                                                  color: primaryColor)),
                                          Text('Logout',
                                              style: normalBoldTextStyle)
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ))
                  ],
                ))
            : LoadingIndicator());
  }
}
