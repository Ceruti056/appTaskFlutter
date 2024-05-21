import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff006877),
      surfaceTint: Color(0xff006877),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff50e5ff),
      onPrimaryContainer: Color(0xff00454f),
      secondary: Color(0xff006877),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff27c0d8),
      onSecondaryContainer: Color(0xff00292f),
      tertiary: Color(0xff005965),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff008091),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfff3fbfd),
      onBackground: Color(0xff161d1e),
      surface: Color(0xfff7fafa),
      onSurface: Color(0xff191c1d),
      surfaceVariant: Color(0xffe0e3e3),
      onSurfaceVariant: Color(0xff434848),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc3c7c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3132),
      inverseOnSurface: Color(0xffeff1f2),
      inversePrimary: Color(0xff00daf6),
      primaryFixed: Color(0xffa2eeff),
      onPrimaryFixed: Color(0xff001f25),
      primaryFixedDim: Color(0xff00daf6),
      onPrimaryFixedVariant: Color(0xff004e5a),
      secondaryFixed: Color(0xffa2eeff),
      onSecondaryFixed: Color(0xff001f25),
      secondaryFixedDim: Color(0xff4dd7f0),
      onSecondaryFixedVariant: Color(0xff004e5a),
      tertiaryFixed: Color(0xffa0efff),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xff6ed5e8),
      onTertiaryFixedVariant: Color(0xff004e59),
      surfaceDim: Color(0xffd8dadb),
      surfaceBright: Color(0xfff7fafa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f4f5),
      surfaceContainer: Color(0xffeceeef),
      surfaceContainerHigh: Color(0xffe6e8e9),
      surfaceContainerHighest: Color(0xffe0e3e3),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff004a55),
      surfaceTint: Color(0xff006877),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff008092),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004a55),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff008092),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff004a54),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff008091),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff3fbfd),
      onBackground: Color(0xff161d1e),
      surface: Color(0xfff7fafa),
      onSurface: Color(0xff191c1d),
      surfaceVariant: Color(0xffe0e3e3),
      onSurfaceVariant: Color(0xff3f4444),
      outline: Color(0xff5c6060),
      outlineVariant: Color(0xff777b7b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3132),
      inverseOnSurface: Color(0xffeff1f2),
      inversePrimary: Color(0xff00daf6),
      primaryFixed: Color(0xff008092),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006674),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff008092),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006574),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff008091),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006673),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dadb),
      surfaceBright: Color(0xfff7fafa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f4f5),
      surfaceContainer: Color(0xffeceeef),
      surfaceContainerHigh: Color(0xffe6e8e9),
      surfaceContainerHighest: Color(0xffe0e3e3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff00272d),
      surfaceTint: Color(0xff006877),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004a55),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00272d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004a55),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00272d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004a54),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff3fbfd),
      onBackground: Color(0xff161d1e),
      surface: Color(0xfff7fafa),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe0e3e3),
      onSurfaceVariant: Color(0xff202525),
      outline: Color(0xff3f4444),
      outlineVariant: Color(0xff3f4444),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3132),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffc5f4ff),
      primaryFixed: Color(0xff004a55),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00323a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004a55),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00323a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004a54),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003239),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dadb),
      surfaceBright: Color(0xfff7fafa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f4f5),
      surfaceContainer: Color(0xffeceeef),
      surfaceContainerHigh: Color(0xffe6e8e9),
      surfaceContainerHighest: Color(0xffe0e3e3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd0f6ff),
      surfaceTint: Color(0xff00daf6),
      onPrimary: Color(0xff00363e),
      primaryContainer: Color(0xff00d9f5),
      onPrimaryContainer: Color(0xff003b44),
      secondary: Color(0xff4dd7f0),
      onSecondary: Color(0xff00363e),
      secondaryContainer: Color(0xff00abc2),
      onSecondaryContainer: Color(0xff000f13),
      tertiary: Color(0xff6ed5e8),
      onTertiary: Color(0xff00363e),
      tertiaryContainer: Color(0xff008091),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff0d1516),
      onBackground: Color(0xffdce4e6),
      surface: Color(0xff101415),
      onSurface: Color(0xffe0e3e3),
      surfaceVariant: Color(0xff434848),
      onSurfaceVariant: Color(0xffc3c7c7),
      outline: Color(0xff8d9191),
      outlineVariant: Color(0xff434848),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e3),
      inverseOnSurface: Color(0xff2d3132),
      inversePrimary: Color(0xff006877),
      primaryFixed: Color(0xffa2eeff),
      onPrimaryFixed: Color(0xff001f25),
      primaryFixedDim: Color(0xff00daf6),
      onPrimaryFixedVariant: Color(0xff004e5a),
      secondaryFixed: Color(0xffa2eeff),
      onSecondaryFixed: Color(0xff001f25),
      secondaryFixedDim: Color(0xff4dd7f0),
      onSecondaryFixedVariant: Color(0xff004e5a),
      tertiaryFixed: Color(0xffa0efff),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xff6ed5e8),
      onTertiaryFixedVariant: Color(0xff004e59),
      surfaceDim: Color(0xff101415),
      surfaceBright: Color(0xff363a3b),
      surfaceContainerLowest: Color(0xff0b0f10),
      surfaceContainerLow: Color(0xff191c1d),
      surfaceContainer: Color(0xff1d2021),
      surfaceContainerHigh: Color(0xff272b2b),
      surfaceContainerHighest: Color(0xff323536),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd0f6ff),
      surfaceTint: Color(0xff00daf6),
      onPrimary: Color(0xff00363e),
      primaryContainer: Color(0xff00d9f5),
      onPrimaryContainer: Color(0xff001216),
      secondary: Color(0xff53dcf5),
      onSecondary: Color(0xff001a1e),
      secondaryContainer: Color(0xff00abc2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff73d9ed),
      onTertiary: Color(0xff001a1e),
      tertiaryContainer: Color(0xff2c9eb0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff0d1516),
      onBackground: Color(0xffdce4e6),
      surface: Color(0xff101415),
      onSurface: Color(0xfff9fbfc),
      surfaceVariant: Color(0xff434848),
      onSurfaceVariant: Color(0xffc8cbcb),
      outline: Color(0xffa0a4a3),
      outlineVariant: Color(0xff808484),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e3),
      inverseOnSurface: Color(0xff272b2b),
      inversePrimary: Color(0xff00505b),
      primaryFixed: Color(0xffa2eeff),
      onPrimaryFixed: Color(0xff001418),
      primaryFixedDim: Color(0xff00daf6),
      onPrimaryFixedVariant: Color(0xff003c45),
      secondaryFixed: Color(0xffa2eeff),
      onSecondaryFixed: Color(0xff001418),
      secondaryFixedDim: Color(0xff4dd7f0),
      onSecondaryFixedVariant: Color(0xff003c45),
      tertiaryFixed: Color(0xffa0efff),
      onTertiaryFixed: Color(0xff001418),
      tertiaryFixedDim: Color(0xff6ed5e8),
      onTertiaryFixedVariant: Color(0xff003c45),
      surfaceDim: Color(0xff101415),
      surfaceBright: Color(0xff363a3b),
      surfaceContainerLowest: Color(0xff0b0f10),
      surfaceContainerLow: Color(0xff191c1d),
      surfaceContainer: Color(0xff1d2021),
      surfaceContainerHigh: Color(0xff272b2b),
      surfaceContainerHighest: Color(0xff323536),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff3fcff),
      surfaceTint: Color(0xff00daf6),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff00defb),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff3fcff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff53dcf5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff2fdff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff73d9ed),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff0d1516),
      onBackground: Color(0xffdce4e6),
      surface: Color(0xff101415),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff434848),
      onSurfaceVariant: Color(0xfff8fbfb),
      outline: Color(0xffc8cbcb),
      outlineVariant: Color(0xffc8cbcb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e3),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002f36),
      primaryFixed: Color(0xffb2f1ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff00defb),
      onPrimaryFixedVariant: Color(0xff001a1e),
      secondaryFixed: Color(0xffb3f1ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff53dcf5),
      onSecondaryFixedVariant: Color(0xff001a1e),
      tertiaryFixed: Color(0xffb1f1ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff73d9ed),
      onTertiaryFixedVariant: Color(0xff001a1e),
      surfaceDim: Color(0xff101415),
      surfaceBright: Color(0xff363a3b),
      surfaceContainerLowest: Color(0xff0b0f10),
      surfaceContainerLow: Color(0xff191c1d),
      surfaceContainer: Color(0xff1d2021),
      surfaceContainerHigh: Color(0xff272b2b),
      surfaceContainerHighest: Color(0xff323536),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
