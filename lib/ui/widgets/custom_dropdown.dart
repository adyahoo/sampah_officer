part of 'widgets.dart';

class CustomDropdown extends StatefulWidget {
  final Widget? child;
  final bool hasLabel;
  final String? label;

  const CustomDropdown(
      {Key? key, this.child, this.label, this.hasLabel = false})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (widget.hasLabel)
            ? Container(
                margin: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label!,
                  style: normalBoldTextStyle,
                ),
              )
            : SizedBox(),
        Container(
            width: double.infinity,
            height: 45,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primaryColor),
                color: inputBgColor),
            child: widget.child),
      ],
    );
  }
}
