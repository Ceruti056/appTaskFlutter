import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278216823),
      surfaceTint: Color(4278216823),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283491839),
      onPrimaryContainer: Color(4278207823),
      secondary: Color(4278216823),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280795352),
      onSecondaryContainer: Color(4278200623),
      tertiary: Color(4278212965),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278222993),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294179837),
      onBackground: Color(4279639326),
      surface: Color(4294441722),
      onSurface: Color(4279835677),
      surfaceVariant: Color(4292928483),
      onSurfaceVariant: Color(4282599496),
      outline: Color(4285823096),
      outlineVariant: Color(4291020743),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151794),
      inverseOnSurface: Color(4293915122),
      inversePrimary: Color(4278246134),
      primaryFixed: Color(4288868095),
      onPrimaryFixed: Color(4278198053),
      primaryFixedDim: Color(4278246134),
      onPrimaryFixedVariant: Color(4278210138),
      secondaryFixed: Color(4288868095),
      onSecondaryFixed: Color(4278198053),
      secondaryFixedDim: Color(4283291632),
      onSecondaryFixedVariant: Color(4278210138),
      tertiaryFixed: Color(4288737279),
      onTertiaryFixed: Color(4278198053),
      tertiaryFixedDim: Color(4285453800),
      onTertiaryFixedVariant: Color(4278210137),
      surfaceDim: Color(4292401883),
      surfaceBright: Color(4294441722),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112501),
      surfaceContainer: Color(4293717743),
      surfaceContainerHigh: Color(4293322985),
      surfaceContainerHighest: Color(4292928483),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278209109),
      surfaceTint: Color(4278216823),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278222994),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278209109),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278222994),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209108),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278222993),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294179837),
      onBackground: Color(4279639326),
      surface: Color(4294441722),
      onSurface: Color(4279835677),
      surfaceVariant: Color(4292928483),
      onSurfaceVariant: Color(4282336324),
      outline: Color(4284244064),
      outlineVariant: Color(4286020475),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151794),
      inverseOnSurface: Color(4293915122),
      inversePrimary: Color(4278246134),
      primaryFixed: Color(4278222994),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278216308),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278222994),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278216052),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278222993),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216307),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401883),
      surfaceBright: Color(4294441722),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112501),
      surfaceContainer: Color(4293717743),
      surfaceContainerHigh: Color(4293322985),
      surfaceContainerHighest: Color(4292928483),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278200109),
      surfaceTint: Color(4278216823),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209109),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200109),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278209109),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200109),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209108),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294179837),
      onBackground: Color(4279639326),
      surface: Color(4294441722),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292928483),
      onSurfaceVariant: Color(4280296741),
      outline: Color(4282336324),
      outlineVariant: Color(4282336324),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151794),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4291163391),
      primaryFixed: Color(4278209109),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202938),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278209109),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202938),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209108),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202937),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401883),
      surfaceBright: Color(4294441722),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112501),
      surfaceContainer: Color(4293717743),
      surfaceContainerHigh: Color(4293322985),
      surfaceContainerHighest: Color(4292928483),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291884799),
      surfaceTint: Color(4278246134),
      onPrimary: Color(4278203966),
      primaryContainer: Color(4278245877),
      onPrimaryContainer: Color(4278205252),
      secondary: Color(4283291632),
      onSecondary: Color(4278203966),
      secondaryContainer: Color(4278234050),
      onSecondaryContainer: Color(4278193939),
      tertiary: Color(4285453800),
      onTertiary: Color(4278203966),
      tertiaryContainer: Color(4278222993),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279047446),
      onBackground: Color(4292666598),
      surface: Color(4279243797),
      onSurface: Color(4292928483),
      surfaceVariant: Color(4282599496),
      onSurfaceVariant: Color(4291020743),
      outline: Color(4287467921),
      outlineVariant: Color(4282599496),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928483),
      inverseOnSurface: Color(4281151794),
      inversePrimary: Color(4278216823),
      primaryFixed: Color(4288868095),
      onPrimaryFixed: Color(4278198053),
      primaryFixedDim: Color(4278246134),
      onPrimaryFixedVariant: Color(4278210138),
      secondaryFixed: Color(4288868095),
      onSecondaryFixed: Color(4278198053),
      secondaryFixedDim: Color(4283291632),
      onSecondaryFixedVariant: Color(4278210138),
      tertiaryFixed: Color(4288737279),
      onTertiaryFixed: Color(4278198053),
      tertiaryFixedDim: Color(4285453800),
      onTertiaryFixedVariant: Color(4278210137),
      surfaceDim: Color(4279243797),
      surfaceBright: Color(4281743931),
      surfaceContainerLowest: Color(4278914832),
      surfaceContainerLow: Color(4279835677),
      surfaceContainer: Color(4280098849),
      surfaceContainerHigh: Color(4280757035),
      surfaceContainerHighest: Color(4281480502),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291884799),
      surfaceTint: Color(4278246134),
      onPrimary: Color(4278203966),
      primaryContainer: Color(4278245877),
      onPrimaryContainer: Color(4278194710),
      secondary: Color(4283686133),
      onSecondary: Color(4278196766),
      secondaryContainer: Color(4278234050),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4285782509),
      onTertiary: Color(4278196766),
      tertiaryContainer: Color(4281114288),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279047446),
      onBackground: Color(4292666598),
      surface: Color(4279243797),
      onSurface: Color(4294573052),
      surfaceVariant: Color(4282599496),
      onSurfaceVariant: Color(4291349451),
      outline: Color(4288717987),
      outlineVariant: Color(4286612612),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928483),
      inverseOnSurface: Color(4280757035),
      inversePrimary: Color(4278210651),
      primaryFixed: Color(4288868095),
      onPrimaryFixed: Color(4278195224),
      primaryFixedDim: Color(4278246134),
      onPrimaryFixedVariant: Color(4278205509),
      secondaryFixed: Color(4288868095),
      onSecondaryFixed: Color(4278195224),
      secondaryFixedDim: Color(4283291632),
      onSecondaryFixedVariant: Color(4278205509),
      tertiaryFixed: Color(4288737279),
      onTertiaryFixed: Color(4278195224),
      tertiaryFixedDim: Color(4285453800),
      onTertiaryFixedVariant: Color(4278205509),
      surfaceDim: Color(4279243797),
      surfaceBright: Color(4281743931),
      surfaceContainerLowest: Color(4278914832),
      surfaceContainerLow: Color(4279835677),
      surfaceContainer: Color(4280098849),
      surfaceContainerHigh: Color(4280757035),
      surfaceContainerHighest: Color(4281480502),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294180095),
      surfaceTint: Color(4278246134),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4278247163),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294180095),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4283686133),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294114815),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4285782509),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279047446),
      onBackground: Color(4292666598),
      surface: Color(4279243797),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282599496),
      onSurfaceVariant: Color(4294507515),
      outline: Color(4291349451),
      outlineVariant: Color(4291349451),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928483),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278202166),
      primaryFixed: Color(4289917439),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4278247163),
      onPrimaryFixedVariant: Color(4278196766),
      secondaryFixed: Color(4289982975),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4283686133),
      onSecondaryFixedVariant: Color(4278196766),
      tertiaryFixed: Color(4289851903),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4285782509),
      onTertiaryFixedVariant: Color(4278196766),
      surfaceDim: Color(4279243797),
      surfaceBright: Color(4281743931),
      surfaceContainerLowest: Color(4278914832),
      surfaceContainerLow: Color(4279835677),
      surfaceContainer: Color(4280098849),
      surfaceContainerHigh: Color(4280757035),
      surfaceContainerHighest: Color(4281480502),
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
