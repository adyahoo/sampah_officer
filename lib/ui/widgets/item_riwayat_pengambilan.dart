part of 'widgets.dart';

class ItemRiwayatPengambilan extends StatelessWidget {
  final TransaksiModel transaksi;

  const ItemRiwayatPengambilan({Key? key, required this.transaksi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime stringToDate =
        new DateFormat("yyyy-MM-dd").parse(transaksi.tglTransaksi);
    String formatedDate = new DateFormat('yMMMMEEEEd').format(stringToDate);
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          child: Text(
            formatedDate.toString(),
            style: normalTextStyle,
          ),
        ),
        Column(
          children: transaksi.daftarTransaksi!
              .map((e) => Container(
                    width: double.infinity,
                    height: 75,
                    margin: EdgeInsets.only(bottom: 16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: secondaryColor,
                      elevation: 4,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.nasabah!.nama!,
                                  style: primaryBoldTextStyle.copyWith(
                                      fontSize: 18),
                                ),
                                Text(
                                  e.waktu!,
                                  style: primaryTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Transaksi : ${convertCurrency(e.totalHarga.toString())}',
                                  style: primaryTextStyle,
                                ),
                                Text(
                                  'Berat Sampah : ${e.totalBerat} kg',
                                  style: primaryTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
