part of 'pages.dart';

class EditSampah extends StatefulWidget {
  final InputSampahModel sampah;
  final int index;

  const EditSampah({Key? key, required this.sampah, required this.index})
      : super(key: key);

  @override
  _EditSampahState createState() => _EditSampahState();
}

class _EditSampahState extends State<EditSampah> {
  int? _selectedJenis;
  String? _namaJenis;
  bool _sampahTapped = false;
  TextEditingController _beratController = TextEditingController();
  bool isFirstTime = true;
  int? _selectedIndex;

  void handleEdit() {
    FocusScope.of(context).unfocus();
    JenisSampahState jenisSampahState = context.read<JenisSampahCubit>().state;
    if (!_sampahTapped) {
      _namaJenis =
          (jenisSampahState as JenisSampahLoaded).jenisSampahs!.first.nama!;
    }
    context.read<InputSampahCubit>().editSampah(_selectedJenis!,
        double.parse(_beratController.text), _namaJenis!, _selectedIndex!);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstTime) {
      _selectedJenis = widget.sampah.jenis_sampah_id;
      _beratController.text = widget.sampah.berat.toString();
      _selectedIndex = widget.index;
      setState(() {
        isFirstTime = false;
      });
    }

    return Scaffold(
      appBar: CustomAppbar(title: 'Edit Sampah'),
      body: SafeArea(
        child: Container(
          width: double.infinity,
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
                        child: BlocBuilder<JenisSampahCubit, JenisSampahState>(
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
                                        e.nama!,
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
                      label: 'Berat (Kg)',
                      hintText: 'Berat Sampah',
                    )
                  ],
                ),
              ),
              CustomButton(
                title: 'Submit',
                onPress: () => handleEdit(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
