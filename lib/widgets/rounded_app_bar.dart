import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoundedAppBar({this.isHomeScreen = false});

  /// Hide title and menu drawer if the appbar is not shown on the home screen.
  final bool isHomeScreen;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: LayoutBuilder(builder: (context, constraint) {
        final width = constraint.maxWidth * 8;
        return Stack(
          children: [
            ClipRect(
              child: OverflowBox(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                child: SizedBox(
                  width: width,
                  height: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: width / 2 - preferredSize.height / 2),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: isHomeScreen ? Colors.white : Colors.transparent,
                    size: 26,
                  ),
                  Text(
                    'Demokart',
                    style: TEXT_HEADING_STYLE.copyWith(
                        color: isHomeScreen ? Colors.white : Colors.transparent,
                        fontSize: 30),
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 26,
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}
