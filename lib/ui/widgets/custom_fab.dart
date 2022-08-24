part of 'widgets.dart';

class CustomFab extends StatelessWidget {
  final Function? onPress;

  const CustomFab({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress!(),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: primaryColor, width: 1),
            color: secondaryColor),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            color: primaryColor,
            size: 35,
          ),
        ),
      ),
    );
  }
}
