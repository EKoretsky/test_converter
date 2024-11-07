import 'package:flutter/material.dart';

// part './light_text_theme.dart';

class AppTheme {
  ThemeData get light {
    return ThemeData(
      // textTheme: _lightTextTheme,
      inputDecorationTheme: const InputDecorationTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blueGrey,
      ),
      cardTheme: const CardTheme(
        clipBehavior: Clip.antiAlias,
      ),
      listTileTheme: const ListTileThemeData(),
      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: true,
        constraints: BoxConstraints(
          minHeight: 400,
          maxHeight: 400,
          // minWidth: double.infinity,
        ),
      ),
    );
  }

//   // Dark theme
//   ThemeData get dark {
//     return ThemeData(
//       textTheme: _darkTextTheme,
//     );
//   }
}
