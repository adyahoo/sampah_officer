part of 'shared.dart';

Color primaryColor = "7C9473".toColor();
Color secondaryColor = "CDD0CB".toColor();
Color tertiaryColor = "E8EAE6".toColor();
Color textColor = "2B2B2B".toColor();
Color inputBgColor = "F9F9F9".toColor();
Color dividerColor = "EFEFEF".toColor();
Color shimmerBaseColor = Colors.grey[400]!;
Color shimmerHighlightColor = Colors.grey[300]!;

TextStyle titleStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w600, fontSize: 22, color: textColor);
TextStyle primaryBoldTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w600, color: primaryColor);
TextStyle normalBoldTextStyle =
    GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600);
TextStyle primaryTextStyle =
    GoogleFonts.poppins().copyWith(color: primaryColor);
TextStyle secondaryTextStyle =
    GoogleFonts.poppins().copyWith(color: secondaryColor);
TextStyle normalTextStyle = GoogleFonts.poppins().copyWith(color: textColor);
TextStyle primaryTextBtnStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white);
TextStyle secondaryTextBtnStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w600, fontSize: 12, color: primaryColor);
TextStyle appbarTitle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w600, fontSize: 22, color: textColor);

ButtonStyle primaryBtnStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(primaryColor),
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
    fixedSize: MaterialStateProperty.all(Size.fromWidth(237)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
ButtonStyle secondaryBtnStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
    fixedSize: MaterialStateProperty.all(Size.fromWidth(237)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        side: BorderSide(color: primaryColor, width: 1),
        borderRadius: BorderRadius.circular(10))));

SnackbarController snackbarSuccess({String? title}) {
  return Get.snackbar("", "",
      backgroundColor: Colors.green,
      titleText: Text(
        title!,
        style: primaryBoldTextStyle.copyWith(color: Colors.white),
      ));
}

SnackbarController snackbarError({String? title, String? message}) {
  return Get.snackbar("", "",
      backgroundColor: Colors.red,
      titleText: Text(
        title!,
        style: primaryBoldTextStyle.copyWith(color: Colors.white),
      ),
      messageText: Text(
        message!,
        style: GoogleFonts.poppins().copyWith(color: Colors.white),
      ));
}
