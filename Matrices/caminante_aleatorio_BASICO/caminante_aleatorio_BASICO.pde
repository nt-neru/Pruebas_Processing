Matrix matrix1;
Walker walker;
int cols = int(random(7, 15)); // Número de columnas de la matriz
int rows = int(random(7, 15)); // Número de filas de la matriz
int cellSize;
int indexNonZero;

void setup() {
  size(500, 500);
  cellSize = width / ((cols > rows) ? cols : rows); // se divide segun el maximo entre las cols y rows

  // Crear la matriz y el caminante
  matrix1 = new Matrix(rows, cols);
  walker = new Walker(matrix1);

  // Establecer un número aleatorio entre el valor mas alto entre la columna o la fila y la suma de estas para los elementos diferentes de cero
  indexNonZero = int(random(((cols > rows) ? cols : rows), (cols+rows)));
  println("Matriz de "+ rows+" , "+cols );
  println("Número objetivo de elementos diferentes de cero: " + indexNonZero);
  
  frameRate(4); // velocidad para ver el moviminto
}

void draw() {
  matrix1.display();
  walker.display();
  walker.move(matrix1);
}
