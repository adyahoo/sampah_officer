part of 'pages.dart';

class AddSampah extends StatefulWidget {
  const AddSampah({Key? key}) : super(key: key);

  @override
  _AddSampahState createState() => _AddSampahState();
}

class _AddSampahState extends State<AddSampah> {
  int _selectedJenis = 1;
  String _namaJenis = '';
  bool _sampahTapped = false;
  TextEditingController _beratController = TextEditingController();

  void handleSubmit() {
    FocusScope.of(context).unfocus();
    JenisSampahState jenisSampahState = context.read<JenisSampahCubit>().state;
    if (!_sampahTapped) {
      _namaJenis =
          (jenisSampahState as JenisSampahLoaded).jenisSampahs!.first.nama!;
    }
    context.read<InputSampahCubit>().inputSampah(
        _selectedJenis, double.parse(_beratController.text), _namaJenis);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Tambah Sampah'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 80,
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      CustomDropdown(
                          label: 'Jenis Sampah',
                          hasLabel: true,
                          child:
                              BlocBuilder<JenisSampahCubit, JenisSampahState>(
                            builder: (context, state) {
                              return DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                hint: Text(
                                  'Pilih Jenis Sampah',
                                  style: secondaryTextStyle,
                                ),
                                value: _selectedJenis,
                                items: (state as JenisSampahLoaded)
                                    .jenisSampahs!
                                    .map((e) => DropdownMenuItem(
                                        value: e.id,
                                        onTap: () {
                                          setState(
                                            () {
                                              _sampahTapped = true;
                                              _namaJenis = e.nama!;
                                            },
                                          );
                                        },
                                        child: Text(
                                          '${e.nama} (${e.satuan})',
                                          style: normalTextStyle,
                                        )))
                                    .toList(),
                                onChanged: ((value) {
                                  setState(() {
                                    _selectedJenis = value!;
                                  });
                                }),
                              );
                            },
                          )),
                      CustomInput(
                        textEditingController: _beratController,
                        textInputType: TextInputType.number,
                        hasLabel: true,
                        label: 'Jumlah',
                        hintText: 'Jumlah Sampah',
                      )
                    ],
                  ),
                ),
                CustomButton(
                  title: 'Submit',
                  onPress: () => {
                    if (_beratController.text == '0' ||
                        _beratController.text == 0 ||
                        _beratController.text.isEmpty)
                      {
                        snackbarError(
                            title: 'Gagal Menambahkan Item',
                            message: 'Isi Berat Sampah')
                      }
                    else
                      {handleSubmit()}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
