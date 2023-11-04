import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class Palette {
  static PaletteEntry white = BasicPalette.white;
  static PaletteEntry red = const PaletteEntry(Color(0xFFAC3232));
  static PaletteEntry red2 = const PaletteEntry(Color(0xFFCC5151));
  static PaletteEntry yellow = const PaletteEntry(Color(0xFFDA9A00));
  static PaletteEntry grey = const PaletteEntry(Color(0xFF404040));
  static PaletteEntry grey2 = const PaletteEntry(Color(0xFF3D3F42));
  static PaletteEntry green = const PaletteEntry(Color(0xFF54a286));
  static PaletteEntry green2 = const PaletteEntry(Color(0xFF8ECC51));
  static TextPaint usernamePaint = TextPaint(
   style: const TextStyle(
      color: Colors.white,
      fontSize: 15.0,
      fontFamily: 'Awesome Font',
    ),
  );
}
