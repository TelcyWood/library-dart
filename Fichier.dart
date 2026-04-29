class Library {
  // Attributs privés
  String _nom;
  List<String> _livres;
  int _capaciteMax;

  // Constructeur principal
  Library(String nom, List<String> livres, int capaciteMax)
      : _nom = nom,
        _livres = livres,
        _capaciteMax = capaciteMax {
    if (capaciteMax <= 0) {
      throw ArgumentError("La capacité maximale doit être strictement supérieure à 0.");
    }
  }

  // Constructeur nommé
  Library.empty()
      : _nom = "Bibliothèque vide",
        _livres = [],
        _capaciteMax = 10;

  // Getters
  String get nom => _nom;

  List<String> get livres => List.unmodifiable(_livres);

  int get capaciteMax => _capaciteMax;

  // Getter calculé
  bool get estPleine => _livres.length >= _capaciteMax;

  // Setter avec validation
  set capaciteMax(int valeur) {
    if (valeur <= 0) {
      throw ArgumentError("La capacité maximale doit être strictement supérieure à 0.");
    }
    _capaciteMax = valeur;
  }

  // Méthode pour ajouter un livre
  void ajouterLivre(String livre) {
    if (estPleine) {
      print("Impossible d'ajouter le livre : la bibliothèque est pleine.");
      return;
    }
    _livres.add(livre);
    print("Livre ajouté : $livre");
  }

  // Méthode pour supprimer un livre
  void supprimerLivre(String livre) {
    if (_livres.remove(livre)) {
      print("Livre supprimé : $livre");
    } else {
      print("Livre introuvable : $livre");
    }
  }

  // Méthode pour lister les livres
  void listerLivres() {
    if (_livres.isEmpty) {
      print("Aucun livre dans la bibliothèque.");
    } else {
      print("Liste des livres :");
      for (var livre in _livres) {
        print("- $livre");
      }
    }
  }
}