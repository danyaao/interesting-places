import 'package:flutter/material.dart';

enum AppTextStyle {
  largeTitle(
    TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
    ),
  ),
  title(
    TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
    ),
  ),
  subtitle(
    TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
    ),
  ),
  text(
    TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
    ),
  ),
  smallBold(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
    ),
  ),
  small(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
    ),
  ),
  superSmall(
    TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0x8F7C7E92),
    ),
  ),
  button(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
