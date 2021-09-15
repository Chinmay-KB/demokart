import 'package:demokart/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
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
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 26,
                  ),
                  Text(
                    'Demokart',
                    style: TEXT_HEADING_STYLE.copyWith(
                        color: Colors.white, fontSize: 30),
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
