part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel? user;

  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  PickedFile? _imagePicked = null;
  DateTime? _selectedDate;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String? _selectedGender;
  final ImagePicker _picker = ImagePicker();
  bool isFirstTime = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.parse(widget.user!.tglLahir!),
        firstDate: DateTime(1990),
        lastDate: DateTime.now());

    if (picked != null && picked != DateTime.now())
      setState(() {
        _selectedDate = picked;
      });
  }

  void handleEditProfile() async {
    setState(() {
      context.loaderOverlay.show();
    });

    String bornDate = DateFormat('yyyy-MM-dd').format(_selectedDate);

    await context.read<UserCubit>().editProfile(_nameController.text, bornDate,
        _phoneController.text, _selectedGender!, _addressController.text,
        image: _imagePicked != null ? File(_imagePicked!.path) : null);
    var state = context.read<UserCubit>().state;

    if (state is UserLoaded) {
      Get.back();
      context.loaderOverlay.hide();
      snackbarSuccess(title: 'Mengubah Profile Berhasil');
    } else {
      context.loaderOverlay.hide();
      snackbarError(
          title: 'Gagal Mengubah Profile',
          message: (state as UserLoadedFailed).message);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserState state = context.read<UserCubit>().state;
    if (state is UserLoaded && isFirstTime) {
      _nameController.text = state.user!.nama!;
      _addressController.text = state.user!.alamat!;
      _phoneController.text = state.user!.telepon!;
      _selectedDate = DateTime.parse(state.user!.tglLahir!);
      _selectedGender = state.user!.jenisKelamin;
      setState(() {
        isFirstTime = false;
      });
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar(
          title: 'Edit Profile',
        ),
        body: ListView(children: [
          Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
            child: Column(
              children: [
                //image profile
                GestureDetector(
                  onTap: () async {
                    _imagePicked = await ImagePicker()
                        .getImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: (_imagePicked != null)
                      ? Container(
                          width: 108,
                          height: 108,
                          margin: EdgeInsets.only(bottom: 60),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(File(_imagePicked!.path)),
                                  fit: BoxFit.cover)),
                        )
                      : Container(
                          width: 108,
                          height: 108,
                          margin: EdgeInsets.only(bottom: 60),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (widget.user?.fotoProfil != null)
                                      ? NetworkImage(
                                          baseUrlImg + widget.user!.fotoProfil!)
                                      : AssetImage(
                                          'assets/images/profile.png',
                                        ) as ImageProvider,
                                  fit: BoxFit.cover)),
                        ),
                ),
                //user information
                CustomInput(
                  textEditingController: _nameController,
                  hintText: 'Nama',
                  hasLabel: true,
                  label: 'Nama',
                ),
                CustomInput(
                  textEditingController: _addressController,
                  hintText: 'Alamat',
                  hasLabel: true,
                  label: 'Alamat',
                ),
                CustomInput(
                  textEditingController: _phoneController,
                  hintText: 'No Telp',
                  hasLabel: true,
                  label: 'No Telp',
                  textInputType: TextInputType.number,
                ),
                CustomDatePicker(
                    selectedDate: _selectedDate.toString().split(' ')[0],
                    onPress: () => _selectDate(context),
                    hasLabel: true,
                    label: 'Tanggal Lahir'),
                CustomDropdown(
                  hasLabel: true,
                  label: 'Jenis Kelamin',
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: SizedBox(),
                    hint:
                        Text('Pilih Jenis Kelamin', style: secondaryTextStyle),
                    value: _selectedGender,
                    items: [
                      DropdownMenuItem(
                        child: Text('Laki-Laki',
                            style:
                                normalTextStyle.copyWith(color: Colors.black)),
                        value: 'laki-laki',
                      ),
                      DropdownMenuItem(
                        child: Text('Perempuan',
                            style:
                                normalTextStyle.copyWith(color: Colors.black)),
                        value: 'perempuan',
                      ),
                    ],
                    onChanged: ((value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    }),
                  ),
                ),
                //section save button
                SizedBox(height: 32),
                CustomButton(
                  title: 'Simpan',
                  onPress: () {
                    if (_nameController.text.isEmpty ||
                        _addressController.text.isEmpty ||
                        _phoneController.text.isEmpty ||
                        _selectedDate == null ||
                        _selectedGender == null) {
                      snackbarError(
                          title: 'Gagal Mengubah Profile',
                          message: 'Mohon Lengkapi Seluruh Data');
                    } else {
                      handleEditProfile();
                    }
                  },
                ),
                CustomButton(
                  title: 'Batal',
                  isPrimary: false,
                  onPress: () {
                    Get.back();
                  },
                ),
              ],
            ),
          )),
        ]));
  }
}
