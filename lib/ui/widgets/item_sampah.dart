part of 'widgets.dart';

class ItemSampah extends StatelessWidget {
  final String? sampah;
  final String? berat;
  final Function? onEditPressed;
  final Function? onDeletePressed;

  const ItemSampah(
      {Key? key,
      this.berat,
      this.onDeletePressed,
      this.onEditPressed,
      this.sampah})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 1, color: primaryColor)),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$sampah - $berat Kg',
                style: normalBoldTextStyle,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: primaryColor,
                    ),
                    onPressed: () => onEditPressed!(),
                  ),
                  IconButton(
                      onPressed: () => onDeletePressed!(),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
