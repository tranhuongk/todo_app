import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/app/utils/common.dart';

class BaseButton extends CupertinoButton {
  BaseButton({
    Key? key,
    required Widget child,
    required VoidCallback? onPressed,
    Color? color,
    bool dismissKeyboard = true,
    bool enableHaptic = true,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    BorderRadius borderRadius = BorderRadius.zero,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed == null
              ? null
              : () {
                  if (enableHaptic) {
                    HapticFeedback.selectionClick();
                  }
                  if (dismissKeyboard) {
                    Common.dismissKeyboard();
                  }
                  onPressed();
                },
          padding: EdgeInsets.zero,
          minSize: 0,
          color: color,
          borderRadius: borderRadius,
          disabledColor: disabledColor,
        );
}
