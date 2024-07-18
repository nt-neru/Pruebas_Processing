class Matrix {
  private int rows, cols;
  private int[][] matrix;
  
  public Matrix(int rows, int cols) {
    this.rows = rows;
    this.cols = cols;
    this.matrix = new int[this.rows][this.cols];

    // Inicializar la matriz con ceros
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        this.matrix[i][j] = 0;
      }
    }
  }
  
  /** Metodo que devuelve la cantidad de celdas distintas a 0 */
  public int nonZeroCount() {
    int count = 0;
    for (int[] row : matrix) {
      for (int col : row) {
        if (col != 0) {
          count++;
        }
      }
    }
    return count;
  }

  /** Metodo que dibuja la matriz */
  void display() {
    stroke(0);
    fill(255);

    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        int x = j * cellSize;
        int y = i * cellSize;

        rect(x, y, cellSize, cellSize);

        // Dibujar conexiones segun el valor binario de la matriz
        int val = this.matrix[i][j];
        if ((val & 1) != 0) line(x + cellSize / 2, y + cellSize / 2, x + cellSize / 2, y); // Arriba dibuja una linea si el primer bit esta activo
        if ((val & 2) != 0) line(x + cellSize / 2, y + cellSize / 2, x + cellSize, y + cellSize / 2); // Derecha dibuja una linea si el segundo bit esta activo
        if ((val & 4) != 0) line(x + cellSize / 2, y + cellSize / 2, x + cellSize / 2, y + cellSize); // Abajo dibuja una linea si el tercero bit esta activo
        if ((val & 8) != 0) line(x + cellSize / 2, y + cellSize / 2, x, y + cellSize / 2); // Izquierda dibuja una linea si el cuarto bit esta activo

        // Mostrar el valor de la celda
        fill(0);
        textAlign(CENTER, CENTER);
        text(val, x + cellSize / 2, y + cellSize / 2);
        fill(255);
      }
    }
  }
  /** Metodo que muestra la matriz por consola */
  public void printMatrix() {
    for (int[] row : matrix) {
      for (int col : row) {
        print(col + " ");
      }
      println();
    }
  }
  /** Metodo que agrega valores a las ponicion actual y la anterior*/
  public void addValue(PVector lastPos, PVector currentPos, int value, int reverseValue){
    // primero en Y porque recorremos la matriz segun las filas
    combineValue(int(lastPos.y), int(lastPos.x), value); // Agregar el valor al indice actual
    combineValue(int(currentPos.y), int(currentPos.x), reverseValue); // Agregar el valor al indice al que se movio
    display();
  }
  
  /** Metodo que combina los valores de una celda especifica de la matriz */
  public void combineValue(int y, int x, int newValue) {
    this.matrix[y][x] |= newValue; // Usa el operador OR bit a bit para comparar entre el valor que tenia el indice y el nuevo valor
  }
  
  /* -- ASESORES -- */
  public int getCols(){  return this.cols;  }
  public int getRows(){  return this.rows;  }
  /** Retorna el valor de un indice especifico */
  public int getValue(int y, int x) {  return this.matrix[y][x];  }
  
}
