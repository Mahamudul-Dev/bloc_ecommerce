import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4283521938),
      surfaceTint: Color(4283521938),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292796671),
      onPrimaryContainer: Color(4278851147),
      secondary: Color(4284112242),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292862457),
      onSecondaryContainer: Color(4279704108),
      tertiary: Color(4285944941),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957042),
      onTertiaryContainer: Color(4281143848),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294703359),
      onBackground: Color(4279966497),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      surfaceVariant: Color(4293124588),
      onSurfaceVariant: Color(4282795599),
      outline: Color(4285953664),
      outlineVariant: Color(4291216848),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inverseOnSurface: Color(4294111479),
      inversePrimary: Color(4290429951),
      primaryFixed: Color(4292796671),
      onPrimaryFixed: Color(4278851147),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4281942905),
      secondaryFixed: Color(4292862457),
      onSecondaryFixed: Color(4279704108),
      secondaryFixedDim: Color(4291020253),
      onSecondaryFixedVariant: Color(4282599001),
      tertiaryFixed: Color(4294957042),
      onTertiaryFixed: Color(4281143848),
      tertiaryFixedDim: Color(4293245656),
      onTertiaryFixedVariant: Color(4284300373),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293124585),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281679732),
      surfaceTint: Color(4283521938),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284969386),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282335829),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285625225),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283971665),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287523204),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294703359),
      onBackground: Color(4279966497),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      surfaceVariant: Color(4293124588),
      onSurfaceVariant: Color(4282532427),
      outline: Color(4284374631),
      outlineVariant: Color(4286216835),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inverseOnSurface: Color(4294111479),
      inversePrimary: Color(4290429951),
      primaryFixed: Color(4284969386),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283324560),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285625225),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283980655),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287523204),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285813099),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293124585),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279377234),
      surfaceTint: Color(4283521938),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281679732),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280164659),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282335829),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281604143),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283971665),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294703359),
      onBackground: Color(4279966497),
      surface: Color(4294703359),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293124588),
      onSurfaceVariant: Color(4280492843),
      outline: Color(4282532427),
      outlineVariant: Color(4282532427),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293585663),
      primaryFixed: Color(4281679732),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280166493),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282335829),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280888382),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283971665),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282393402),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293124585),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4290429951),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4280429665),
      primaryContainer: Color(4281942905),
      onPrimaryContainer: Color(4292796671),
      secondary: Color(4291020253),
      onSecondary: Color(4281085762),
      secondaryContainer: Color(4282599001),
      onSecondaryContainer: Color(4292862457),
      tertiary: Color(4293245656),
      onTertiary: Color(4282656318),
      tertiaryContainer: Color(4284300373),
      onTertiaryContainer: Color(4294957042),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279374616),
      onBackground: Color(4293124585),
      surface: Color(4279374616),
      onSurface: Color(4293124585),
      surfaceVariant: Color(4282795599),
      onSurfaceVariant: Color(4291216848),
      outline: Color(4287664282),
      outlineVariant: Color(4282795599),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inverseOnSurface: Color(4281348150),
      inversePrimary: Color(4283521938),
      primaryFixed: Color(4292796671),
      onPrimaryFixed: Color(4278851147),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4281942905),
      secondaryFixed: Color(4292862457),
      onSecondaryFixed: Color(4279704108),
      secondaryFixedDim: Color(4291020253),
      onSecondaryFixedVariant: Color(4282599001),
      tertiaryFixed: Color(4294957042),
      onTertiaryFixed: Color(4281143848),
      tertiaryFixedDim: Color(4293245656),
      onTertiaryFixedVariant: Color(4284300373),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4290758911),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4278456134),
      primaryContainer: Color(4286811592),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291283425),
      onSecondary: Color(4279375142),
      secondaryContainer: Color(4287467430),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293574364),
      onTertiary: Color(4280749090),
      tertiaryContainer: Color(4289496481),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279374616),
      onBackground: Color(4293124585),
      surface: Color(4279374616),
      onSurface: Color(4294834943),
      surfaceVariant: Color(4282795599),
      onSurfaceVariant: Color(4291545812),
      outline: Color(4288848556),
      outlineVariant: Color(4286743180),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inverseOnSurface: Color(4280887855),
      inversePrimary: Color(4282008698),
      primaryFixed: Color(4292796671),
      onPrimaryFixed: Color(4278192448),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4280824423),
      secondaryFixed: Color(4292862457),
      onSecondaryFixed: Color(4279046177),
      secondaryFixedDim: Color(4291020253),
      onSecondaryFixedVariant: Color(4281480520),
      tertiaryFixed: Color(4294957042),
      onTertiaryFixed: Color(4280354589),
      tertiaryFixedDim: Color(4293245656),
      onTertiaryFixedVariant: Color(4283116612),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294834943),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290758911),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294834943),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291283425),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965754),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293574364),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279374616),
      onBackground: Color(4293124585),
      surface: Color(4279374616),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282795599),
      onSurfaceVariant: Color(4294834943),
      outline: Color(4291545812),
      outlineVariant: Color(4291545812),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4279969114),
      primaryFixed: Color(4293125631),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290758911),
      onPrimaryFixedVariant: Color(4278456134),
      secondaryFixed: Color(4293191166),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291283425),
      onSecondaryFixedVariant: Color(4279375142),
      tertiaryFixed: Color(4294958579),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293574364),
      onTertiaryFixedVariant: Color(4280749090),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
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