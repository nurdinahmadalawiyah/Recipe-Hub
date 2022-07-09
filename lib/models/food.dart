class Food {
  final String id;
  final String title;
  final String category;
  final List<String>? ingredients;
  final String imageUrl;
  final int duration;

  Food({
    required this.id,
    required this.title,
    required this.category,
    required this.ingredients,
    required this.imageUrl,
    required this.duration,
  });
}