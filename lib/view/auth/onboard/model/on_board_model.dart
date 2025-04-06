class OnBoardModel {
  final String title;
  final String description;
  final String imagePath;
  final String upTextButton;
  final String downTextButton;
  final String? prevTextButton;

  OnBoardModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.upTextButton,
    required this.downTextButton,
    this.prevTextButton,
  });
}
