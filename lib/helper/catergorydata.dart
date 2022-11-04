import '../model/catergorymodel.dart';

List<CategoryModel> getCategories() {
  // new list
  // ignore: deprecated_member_use
  List<CategoryModel> categories = <CategoryModel>[];
  CategoryModel category = CategoryModel(categoryName: '', imageUrl: '');

  category.categoryName = "Entertainment";
  category.imageUrl =
      'https://images.unsplash.com/photo-1560169897-fc0cdbdfa4d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80';
  categories.add(category);

  category = CategoryModel(categoryName: '', imageUrl: '');
  category.categoryName = "Business";
  category.imageUrl =
      "https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=815&q=80";
  categories.add(category);

  category = CategoryModel(categoryName: '', imageUrl: '');
  category.categoryName = "Sports";
  category.imageUrl =
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  categories.add(category);

  category = CategoryModel(categoryName: '', imageUrl: '');
  category.categoryName = "General";
  category.imageUrl =
      'https://images.unsplash.com/photo-1546422904-90eab23c3d7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80';
  categories.add(category);

  category = CategoryModel(categoryName: '', imageUrl: '');
  category.categoryName = "Health";
  category.imageUrl =
      "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80";
  categories.add(category);

  category = CategoryModel(categoryName: '', imageUrl: '');
  category.categoryName = "Science";
  category.imageUrl =
      "https://images.unsplash.com/photo-1582719471384-894fbb16e074?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";
  categories.add(category);

  return categories;
}
