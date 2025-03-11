  import 'package:flutter/material.dart';
  import 'package:venturo_core/features/crud_books/constants/crud_books_assets_constant.dart';
  class CrudBooksScreen extends StatelessWidget {
    CrudBooksScreen({Key? key}):super(key: key);

    final assetsConstant = CrudBooksAssetsConstant();
    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(
          child: Text('CrudBooksScreen ADMIN'),
        ),
      );
    }
  }
    