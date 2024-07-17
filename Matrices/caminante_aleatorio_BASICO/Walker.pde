class Walker {
  private int currentX, currentY; // Posicion actual del caminante

  public Walker(Matrix m) {
    this.currentX = int(random(m.cols)); // posicion x aleatoria dentro de la matriz
    this.currentY = int(random(m.rows)); // posicion y aleatoria dentro de la matriz
  }

  public void move(Matrix matrix) {
    int dir = int(random(4)); // 0: arriba, 1: derecha, 2: abajo, 3: izquierda
    int newX = currentX;
    int newY = currentY;

    switch (dir) {
      case 0:
        newY--; // Mover hacia arriba
        break;
      case 1:
        newX++; // Mover hacia la derecha
        break;
      case 2:
        newY++; // Mover hacia abajo
        break;
      case 3:
        newX--; // Mover hacia la izquierda
        break;
    }

    // Verificando que las nuevas coordenadas esten dentro de los limites de la matriz
    if (newX >= 0 && newX < matrix.cols && newY >= 0 && newY < matrix.rows) {
      
      // << operador de desplazamiento, desplaza los bits hacia la izquierda segun la direccion de desplazamiento
      int binaryValue = 1 << dir; // Calcular el valor binario segun la direccion
      matrix.update(currentY, currentX, binaryValue); // Agregar el valor al indice actual
      
      int reverseDir = (dir + 2) % 4; // Calcular la direccion opuesta
      int reverseBinaryValue = 1 << reverseDir; // Calcular el valor binario de la direccion opuesta
      matrix.update(newY, newX, reverseBinaryValue); // Agregar el valor al indice al que se movio

      // Mover el caminante a la nueva posicion
      this.currentX = newX;
      this.currentY = newY;
      
      display();
    }

    // Si el numero de elementos no ceros es igual al objetivo, detener el bucle draw()
    int nonZeroCount = matrix.nonZeroCount(); // Obtiene el numero de celdas no nulas en la matriz
    if (nonZeroCount >= indexNonZero) {
      noLoop();
      println("Matriz completada con " + nonZeroCount + " elementos diferentes de cero:");
      for (int i = 0; i < matrix.rows; i++) {
        for (int j = 0; j < matrix.cols; j++) {
          print(" " + matrix.matrix[i][j]);
        }
        println();
      }
    }
  }

  public void display() {
    // Resaltar la posicion actual del caminante
    fill(0, 0, 255,100); // Color azul
    noStroke();
    rect(currentX * cellSize, currentY * cellSize, cellSize, cellSize);
  }
}
