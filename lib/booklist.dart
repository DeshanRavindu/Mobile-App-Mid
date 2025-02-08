import 'package:flutter/material.dart';
import 'book.dart';

class BookListScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Flutter Basics',
      author: 'Jonathan Sande & Matt Gallow',
      price: 1500.00,
      imageUrl:
          'https://m.media-amazon.com/images/I/61KQ4EoU3IS._AC_UF1000,1000_QL80_.jpg',
    ),
    Book(
      title: 'Advanced Flutter Development',
      author: 'Erman Balturk',
      price: 1200.00,
      imageUrl:
          'https://m.media-amazon.com/images/I/61Xo47uQSBL._UF1000,1000_QL80_.jpg',
    ),
    Book(
      title: 'Dart Programming',
      author: 'Gilad Bracha',
      price: 1000.00,
      imageUrl:
          'https://m.media-amazon.com/images/I/41PvblrnDyL._AC_UF1000,1000_QL80_.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Book Store.lk')),
        backgroundColor: Colors.deepPurpleAccent[100],
        toolbarHeight: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: books.map((book) => BookCard(book: book)).toList(),
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            book.imageUrl,
            height: 450,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _placeholderImage();
            },
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 4),
                Text(
                  book.author,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.price.toStringAsFixed(2), // Removed "$" sign
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Added to cart: ${book.title}')),
                        );
                      },
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Placeholder widget if an image fails to load
  Widget _placeholderImage() {
    return Container(
      height: 200,
      color: Colors.grey,
      child: Center(child: Text('Image not available')),
    );
  }
}
