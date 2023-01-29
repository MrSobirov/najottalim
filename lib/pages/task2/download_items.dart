class DownloadItems {
  static List<FileInfo> documents = [
    FileInfo(
      name: 'Flutter book',
      url: 'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf',
    ),
    FileInfo(
      name: 'Swift Language',
      url: 'https://carlosicaza.com/swiftbooks/SwiftLanguage.pdf',
    ),
    FileInfo(
      name: 'LearnJava',
      url: 'https://www.cs.cmu.edu/afs/cs.cmu.edu/user/gchen/www/download/java/LearnJava.pdf',
    ),
    FileInfo(
      name: 'PHP Programming Cookbook',
      url: 'https://assets.ctfassets.net/nkydfjx48olf/5qFMF3mvitLMahX67i7iOb/028229996c13cbc27a0538f055a41b46/php_cookbook.pdf',
    ),
    FileInfo(
      name: 'Complete Guide to Programming in C++',
      url: 'http://www.lmpt.univ-tours.fr/~volkov/C++.pdf',
    ),
  ];
}

class FileInfo {
  const FileInfo({required this.name, required this.url});

  final String name;
  final String url;
}
