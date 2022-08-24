part of 'widgets.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: Center(
        child: SpinKitFadingCircle(
          color: primaryColor,
          size: 50,
        ),
      ),
    );
  }
}
