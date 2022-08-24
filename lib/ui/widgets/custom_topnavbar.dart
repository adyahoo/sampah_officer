part of 'widgets.dart';

class CustomTopnavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomTopnavbar({Key? key, this.selectedIndex = 0, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: (() {
              if (onTap != null) {
                onTap!(0);
              }
            }),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color: (selectedIndex == 0)
                              ? primaryColor
                              : Colors.white))),
              child: Text(
                'Pemasukan',
                style: normalBoldTextStyle,
              ),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color: (selectedIndex == 1)
                              ? primaryColor
                              : Colors.white))),
              child: Text(
                'Penukaran',
                style: normalBoldTextStyle,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
