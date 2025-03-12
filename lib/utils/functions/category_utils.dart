Map<String, String> categoryMap = {
  '1': 'Spirituality & Religion',
  '2': 'Academic Paper',
  '3': 'Mystery',
  '4': 'Thriller',
  '5': 'Science Fiction (Sci-Fi)',
  '6': 'Horror',
  '7': 'Romance',
  '8': 'Historical Fiction',
  '9': 'Adventure',
  '10': 'Young Adult (YA)',
  '11' : 'Children',
  '12' : 'Self-Help',
  '13' : 'Biography & Memoir',
  '14' : 'Philosophy',
  '15' : 'Science',  
  '16' : 'History',
  '17' : 'Travel',
  '18' : 'Cooking',
  '19' : 'Art',
  '20' : 'Others',
};

String getReadableCategory(String code) {
  return categoryMap[code] ?? code;
}