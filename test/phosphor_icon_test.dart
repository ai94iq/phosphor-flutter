import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  test('flat icons are plain IconData in their own font', () {
    const icon = PhosphorIconsRegular.acorn;
    expect(icon.runtimeType, IconData);
    expect(icon.fontFamily, 'PhosphorRegular');
    expect(icon.fontPackage, 'phosphor_flutter');
    expect(PhosphorIcons.acorn(PhosphorIconsStyle.bold).fontFamily,
        'PhosphorBold');
  });

  test('duotone icons map to their back layer', () {
    final back = phosphorDuotoneSecondary(PhosphorIconsDuotone.acorn);
    expect(back, isNotNull);
    expect(back!.fontFamily, 'PhosphorDuotone');
    expect(back.codePoint, isNot(PhosphorIconsDuotone.acorn.codePoint));
    expect(phosphorDuotoneSecondary(PhosphorIconsRegular.acorn), isNull);
  });

  testWidgets('PhosphorIcon draws both duotone layers', (tester) async {
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: PhosphorIcon(PhosphorIconsDuotone.acorn),
    ));
    // PhosphorIcon paints the front layer itself; the back layer is an Icon.
    expect(find.byType(Icon), findsOneWidget);

    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: PhosphorIcon(PhosphorIconsRegular.acorn),
    ));
    expect(find.byType(Icon), findsNothing);
  });
}
