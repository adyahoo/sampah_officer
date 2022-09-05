part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: Future.wait([
          context.read<UserCubit>().getProfile(),
          context.read<TransaksiCubit>().getTransaksi(),
          context.read<JenisSampahCubit>().getJenisSampah(),
          context.read<NasabahCubit>().getNasabah()
        ]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                return Scaffold(
                  floatingActionButton: Container(
                    margin: EdgeInsets.only(bottom: 70),
                    child: CustomFab(onPress: () {
                      Get.to(() => FormInputSampah())?.then((value) {
                        setState(() {});
                      });
                    }),
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              //header welcome user
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 56),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Hi ${(state as UserLoaded).user!.nama}',
                                        style: primaryTextStyle),
                                    Text('Welcome Back!',
                                        style: titleStyle.copyWith(
                                            color: primaryColor)),
                                  ],
                                ),
                              ),
                              //section history pengambilan
                              SectionTitle(title: 'Riwayat Pengambilan'),
                              BlocBuilder<TransaksiCubit, TransaksiState>(
                                builder: (context, state) => (state
                                            is TransaksiLoaded &&
                                        state.transaksis!.length > 0)
                                    ? Container(
                                        width: double.infinity,
                                        child: Column(
                                          children: state.transaksis!
                                              .map((e) =>
                                                  ItemRiwayatPengambilan(
                                                      transaksi: e))
                                              .toList(),
                                        ),
                                      )
                                    : Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height -
                                                250,
                                        child: Center(
                                            child: Text(
                                          'Tidak Ada Data Transaksi',
                                          style: primaryBoldTextStyle.copyWith(
                                              fontSize: 18),
                                        )),
                                      ),
                              ),
                              SizedBox(
                                height: 70,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return LoadingIndicator();
              }
            case ConnectionState.waiting:
              return LoadingIndicator();
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
