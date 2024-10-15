import 'dart:io';

class FileParams {
  String fileName;
  File file;
  FileParams(this.fileName, this.file);
}

class DataParams {
  String label;
  String value;
  DataParams(this.label, this.value);
}

class ListItem {
  String value;
  String name;
  ListItem(this.value, this.name);
}
