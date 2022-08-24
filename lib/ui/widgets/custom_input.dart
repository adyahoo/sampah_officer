part of 'widgets.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final bool hasLabel;
  final String label;
  final String hintText;
  final TextInputType textInputType;

  const CustomInput(
      {Key? key,
      required this.textEditingController,
      this.textInputType = TextInputType.text,
      this.hintText = '',
      this.label = '',
      this.isPassword = false,
      this.hasLabel = false})
      : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (widget.hasLabel)
            ? Container(
                margin: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label,
                  style: normalBoldTextStyle,
                ),
              )
            : SizedBox(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: primaryColor),
              color: inputBgColor),
          child: TextField(
            controller: widget.textEditingController,
            obscureText: (widget.isPassword) ? !_passwordVisible : false,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: secondaryTextStyle,
              hintText: widget.hintText,
              suffixIcon: (widget.isPassword)
                  ? IconButton(
                      splashRadius: 5,
                      icon: Icon(
                        !_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
