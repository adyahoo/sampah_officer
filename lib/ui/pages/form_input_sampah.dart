part of 'pages.dart';

class FormInputSampah extends StatefulWidget {
  const FormInputSampah({Key? key}) : super(key: key);

  @override
  _FormInputSampahState createState() => _FormInputSampahState();
}

class _FormInputSampahState extends State<FormInputSampah> {
  int? _selectedNasabah;
  List<InputSampahModel> sampahs = [];
  TextEditingController _searchController = TextEditingController();

  void handleSubmit() async {
    setState((() {
      context.loaderOverlay.show();
    }));

    await context
        .read<InputSampahCubit>()
        .storeSampah(_selectedNasabah!, sampahs);
    InputSampahState state = context.read<InputSampahCubit>().state;

    if (state is StoreSampahSuccess) {
      context.loaderOverlay.hide();
      snackbarSuccess(title: state.message);
    } else {
      context.loaderOverlay.hide();
      snackbarError(
          title: 'Gagal Menyimpan Data Sampah',
          message: (state as StoreSampahFailed).message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Form Input Sampah'),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomDropdown(
                    label: 'Pilih Nasabah',
                    hasLabel: true,
                    child: BlocBuilder<NasabahCubit, NasabahState>(
                      builder: (context, state) {
                        return SearchField<NasabahModel>(
                          hint: 'Cari Nama Nasabah',
                          onSuggestionTap: (value) {
                            setState(() {
                              _selectedNasabah = value.item!.id!;
                            });
                          },
                          controller: _searchController,
                          searchInputDecoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.arrow_drop_down,
                                size: 36,
                                color: primaryColor,
                              )),
                          maxSuggestionsInViewPort: 5,
                          suggestions: (state as NasabahLoaded)
                              .nasabahs!
                              .map((e) => SearchFieldListItem<NasabahModel>(
                                  '${e.kodeNasabah} - ${e.nama}',
                                  item: e))
                              .toList(),
                        );
                      },
                    )),
              ),
              CustomDivider(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Text(
                  'List Sampah',
                  style: normalBoldTextStyle.copyWith(fontSize: 18),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(bottom: 16),
                child: BlocBuilder<InputSampahCubit, InputSampahState>(
                  builder: (context, state) {
                    if (state is InputSampahLoaded) {
                      sampahs = state.inputSampahs;
                      return ListView(
                        shrinkWrap: true,
                        children: sampahs
                            .map((e) => ItemSampah(
                                  sampah: e.namaJenis,
                                  berat: e.berat.toString(),
                                  onDeletePressed: () {
                                    setState(() {
                                      sampahs.removeAt(sampahs.indexOf(e));
                                    });
                                  },
                                  onEditPressed: () {
                                    Get.to(() => EditSampah(
                                          sampah: e,
                                          index: sampahs.indexOf(e),
                                        ));
                                  },
                                ))
                            .toList(),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
              CustomButton(
                title: 'Submit',
                onPress: () {
                  print(_searchController.text);
                  if (_selectedNasabah == null ||
                      _searchController.text.isEmpty ||
                      sampahs.isEmpty) {
                    snackbarError(
                        title: 'Terjadi Kesalahan',
                        message: 'Mohon Lengkapi Seluruh Data');
                  } else {
                    handleSubmit();
                  }
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFab(
        onPress: () {
          Get.to(() => AddSampah());
        },
      ),
    );
  }
}
