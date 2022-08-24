part of 'widgets.dart';

class TransactionSummaryCard extends StatelessWidget {
  final Function? onPress;

  const TransactionSummaryCard({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress!(),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Penukaran Saldo',
                style: normalBoldTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 12,
              ),
              Image.asset(
                'assets/images/income_icon.png',
                color: Colors.black,
                width: 40,
                height: 40,
              )
            ],
          )),
    );
  }
}
