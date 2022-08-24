part of 'widgets.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool hasButton;
  final Function? onPress;
  final String? btnTitle;

  const SectionTitle(
      {Key? key,
      required this.title,
      this.onPress,
      this.btnTitle,
      this.hasButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(right: 30, bottom: 4),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2, color: primaryColor))),
          child: Text(
            title,
            style: normalBoldTextStyle.copyWith(fontSize: 22),
          ),
        ),
        (hasButton)
            ? TextButton(
                onPressed: !hasButton ? null : () => onPress!(),
                child: Text(btnTitle!,
                    style: primaryTextStyle.copyWith(
                        decoration: TextDecoration.underline)))
            : SizedBox()
      ],
    );
  }
}
