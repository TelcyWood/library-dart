class Library {
  // Attributs privés
  String _name;
  List<String> _books;
  int _maxCapacity;

  // Constructeur principal
  Library(String name, List<String> books, int maxCapacity)
      : _name = name,
        _books = books,
        _maxCapacity = maxCapacity {
    if (maxCapacity <= 0) {
      throw ArgumentError("La capacité maximale doit être > 0");
    }
  }

  // Constructeur nommé
  Library.empty()
      : _name = "Bibliothèque vide",
        _books = [],
        _maxCapacity = 10;

  // Getters
  String get name => _name;

  List<String> get books => List.unmodifiable(_books);

  int get maxCapacity => _maxCapacity;

  // Getter calculé
  bool get isFull => _books.length >= _maxCapacity;

  // Setter avec validation
  set maxCapacity(int value) {
    if (value <= 0) {
      throw ArgumentError("La capacité maximale doit être > 0");
    }
    _maxCapacity = value;
  }

  // Méthode pour ajouter un livre
  void addBook(String book) {
    if (isFull) {
      print("Impossible d'ajouter le livre : bibliothèque pleine.");
      return;
    }
    _books.add(book);
    print("Livre ajouté : $book");
  }

  // Méthode pour supprimer un livre
  void removeBook(String book) {
    if (_books.remove(book)) {
      print("Livre supprimé : $book");
    } else {
      print("Livre non trouvé : $book");
    }
  }

  // Méthode pour lister les livres
  void listBooks() {
    if (_books.isEmpty) {
      print("Aucun livre dans la bibliothèque.");
    } else {
      print("Liste des livres :");
      for (var book in _books) {
        print("- $book");
      }
    }
  }
}
