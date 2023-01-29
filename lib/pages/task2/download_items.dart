class DownloadItems {
  static const documents = [
    FileInfo(
      name: 'Android Programming Cookbook',
      url: 'https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf',
    ),
    FileInfo(
      name: 'iOS Programming Guide',
      url: 'https://carlosicaza.com/swiftbooks/SwiftLanguage.pdf',
    ),
  ];
}

class FileInfo {
  const FileInfo({required this.name, required this.url});

  final String name;
  final String url;
}
