library phosphor_flutter;

import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/src/phosphor_icons_duotone.dart';

/// Phosphor icons are plain [IconData]. Flutter made [IconData] a final
/// class, so the package can no longer subclass it; these aliases keep
/// existing type annotations compiling.
typedef PhosphorIconData = IconData;

/// See [PhosphorIconData].
typedef PhosphorFlatIconData = IconData;

/// The back layer of a duotone icon, or null when [icon] is not a
/// Phosphor duotone icon.
IconData? phosphorDuotoneSecondary(IconData icon) {
  if (icon.fontFamily != 'PhosphorDuotone' ||
      icon.fontPackage != 'phosphor_flutter') {
    return null;
  }
  return phosphorDuotoneBackgrounds[icon.codePoint];
}
