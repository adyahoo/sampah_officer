part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavbar({Key? key, this.selectedIndex = 0, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                          width: 2,
                          color: (selectedIndex == 0)
                              ? primaryColor
                              : Colors.white))),
              child: Image.asset(
                'assets/images/home_icon.png',
                width: 28,
                height: 28,
                color: (selectedIndex == 0) ? primaryColor : secondaryColor,
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     if (onTap != null) {
          //       onTap!(1);
          //     }
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(16),
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         border: Border(
          //             top: BorderSide(
          //                 width: 2,
          //                 color: (selectedIndex == 1)
          //                     ? primaryColor
          //                     : Colors.white))),
          //     child: Image.asset(
          //       'assets/images/trash_icon.png',
          //       width: 28,
          //       height: 28,
          //       color: (selectedIndex == 1) ? primaryColor : secondaryColor,
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                          width: 2,
                          color: (selectedIndex == 1)
                              ? primaryColor
                              : Colors.white))),
              child: Image.asset(
                'assets/images/profile_icon.png',
                width: 32,
                height: 32,
                color: (selectedIndex == 1) ? primaryColor : secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
