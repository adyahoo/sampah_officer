part of 'widgets.dart';

class CustomDatePicker extends StatefulWidget {
  final String? selectedDate;
  final Function? onPress;
  final bool hasLabel;
  final String? label;

  const CustomDatePicker(
      {Key? key,
      this.onPress,
      this.selectedDate,
      this.hasLabel = false,
      this.label})
      : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
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
        GestureDetector(
          onTap: () => widget.onPress!(),
          child: Container(
            width: double.infinity,
            height: 45,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primaryColor),
                color: inputBgColor),
            child: Text(
              widget.selectedDate != 'null'
                  ? widget.selectedDate!
                  : 'Tanggal Lahir',
              style: widget.selectedDate == 'null'
                  ? secondaryTextStyle
                  : normalTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
