class StyleRadioModel {
  bool isSelected;
  final String groupName;
  final String groupCode;

  StyleRadioModel(this.isSelected, this.groupName, this.groupCode);
}

class Groupmodel {
  final String groupName;
  final String imageName;
  final String content;
  final String institutionName;

  Groupmodel(
      this.groupName, this.imageName, this.content, this.institutionName);
}
