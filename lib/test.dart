import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import 'main.dart';

class MyText extends Container {
  MyText( MyHomePageState state, String text, {Key? key} ) : super(key: key,
      width: state.contentWidth,
      alignment: Alignment.topLeft,
      child: Text( text )
  );
}
class MyTextColor extends Container {
  MyTextColor( MyHomePageState state, String text, {Key? key} ) : super(key: key,
      width: state.contentWidth,
      alignment: Alignment.topLeft,
      child: Text(
          text,
          style: const TextStyle(
              color: Color( 0xFF0000FF )
          )
      )
  );
}

void test( MyHomePageState state ) async {
  state.addConsole( MyTextColor(state, 'getApplicationDocumentsDirectory') );
  {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path;
    state.addConsole(MyText(state, path));
  }

  state.addConsole( MyTextColor(state, 'getApplicationSupportDirectory') );
  {
    Directory directory = await getApplicationSupportDirectory();
    String path = directory.path;
    state.addConsole(MyText(state, path));
  }

  state.addConsole( MyTextColor(state, 'getExternalCacheDirectories') );
  try {
    List<Directory>? directories = await getExternalCacheDirectories();
    if( directories != null ) {
      for (Directory directory in directories) {
        String path = directory.path;
        state.addConsole(MyText(state, path));
      }
    }
  } on UnsupportedError {
    state.addConsole(MyText(state, 'UnsupportedError'));
  }

  state.addConsole( MyTextColor(state, 'getExternalStorageDirectories') );
  try {
    for( StorageDirectory type in StorageDirectory.values ) {
      state.addConsole(MyText(state, '[$type]'));
      List<Directory>? directories = await getExternalStorageDirectories(type: type);
      if (directories != null) {
        for (Directory directory in directories) {
          String path = directory.path;
          state.addConsole(MyText(state, path));
        }
      }
    }
  } on UnsupportedError {
    state.addConsole(MyText(state, 'UnsupportedError'));
  }

  state.addConsole( MyTextColor(state, 'getExternalStorageDirectory') );
  try {
    Directory? directory = await getExternalStorageDirectory();
    if( directory != null ) {
      String path = directory.path;
      state.addConsole(MyText(state, path));
    }
  } on UnsupportedError {
    state.addConsole(MyText(state, 'UnsupportedError'));
  }

  state.addConsole( MyTextColor(state, 'getLibraryDirectory') );
  try {
    Directory directory = await getLibraryDirectory();
    String path = directory.path;
    state.addConsole(MyText(state, path));
  } on UnsupportedError {
    state.addConsole(MyText(state, 'UnsupportedError'));
  }

  state.addConsole( MyTextColor(state, 'getTemporaryDirectory') );
  {
    Directory directory = await getTemporaryDirectory();
    String path = directory.path;
    state.addConsole(MyText(state, path));
  }
}
