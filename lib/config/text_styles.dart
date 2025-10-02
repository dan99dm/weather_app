import 'package:flutter/material.dart';

import 'colors.dart';

class BrandTextStyle {
  static final _default = TextStyle(
    fontFamily: 'Inter',
    color: BrandColors.dark,
  );

  static final s30w700 = _default.copyWith(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  static final s18w400 = _default.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final s14w400 = _default.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
