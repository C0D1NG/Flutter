import 'dart:io';

void main(List<String> arguments) {
  print('What should we call your new flutter project?');
  final name = stdin.readLineSync() ?? 'anonymous';
  Directory(path + name).create(recursive: true).then((folder) {
    //copyPath('./bin/sourceFiles', 'folder.path');
    print(
        'Your project is succesfully created at ${folder.path} , now run the command \'flutter create $name\' in your directory to create a new flutter project');
  }).catchError((errormsg) {
    print('Error occured due to $errormsg');
  });
}

final path = './';

Future<void> copyPath(String from, String to) async {
  await Directory(to).create(recursive: true);
  await for (final file in Directory(from).list(recursive: true)) {
    final copyTo = to;
    if (file is Directory) {
      await Directory(copyTo).create(recursive: true);
    } else if (file is File) {
      await File(file.path).copy(copyTo);
    } else if (file is Link) {
      await Link(copyTo).create(await file.target(), recursive: true);
    }
  }
}
