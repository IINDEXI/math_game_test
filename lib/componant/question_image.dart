class Question_image {
  final String id;
  final String image;
  final String title;
  final Map<String, bool> options;

  Question_image ({
    required this.id,
    required this.image,
    required this.title,
    required this.options,
  });

  @override
  String toString() {
    return 'Question(id: $id,image: $image ,title: $title,options:$options)';
  }
}