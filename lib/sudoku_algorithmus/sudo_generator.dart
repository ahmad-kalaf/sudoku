class SudokuGenerator {
  static List<List<int>> erstelleSudoku81(int nullFelderAnzahl) {
    List<List<int>> raster = [];
    fuelleDiagonal(raster);
    fuelleRestliche(raster, 0, 0);
    entferneFelder(nullFelderAnzahl);

    return raster;
  }

  // Gibt false zurück, wenn der gegebene 3x3-Block die Zahl enthält
  // Stellt sicher, dass die Zahl nicht im Block verwendet wird
  static bool nichtInBlockVerwendet(List<List<int>> raster, int zeilenStart, int spaltenStart, int zahl) {
    return false;
  }

  // Füllt eine 3x3-Matrix
  // Weist gültige Zufallszahlen dem 3x3-Teilraster zu
  static void fuelleBlock(List<List<int>> raster, int zeile, int spalte) {}

  // Prüft, ob die Zahl sicher in Zeile i gesetzt werden kann
  // Stellt sicher, dass die Zahl nicht bereits in der Zeile verwendet wird
  static bool nichtInZeileVerwendet(List<List<int>> raster, int i, int zahl) {
    return false;
  }

  // Prüft, ob die Zahl sicher in Spalte j gesetzt werden kann
  // Stellt sicher, dass die Zahl nicht bereits in der Spalte verwendet wird
  static bool nichtInSpalteVerwendet(List<List<int>> raster, int j, int zahl) {
    return false;
  }

  // Prüft, ob die Zahl sicher in die Zelle (i, j) gesetzt werden kann
  // Stellt sicher, dass die Zahl nicht in Zeile, Spalte oder Block verwendet wird
  static bool istSicher(List<List<int>> raster, int i, int j, int zahl) {
    return false;
  }

  static void fuelleDiagonal(List<List<int>> raster) {}

  static void fuelleRestliche(List<List<int>> raster, int i, int j) {}

  static void entferneFelder(int nullFelderAnzahl) {}
}
