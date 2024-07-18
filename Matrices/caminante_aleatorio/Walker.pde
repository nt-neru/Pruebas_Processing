class Walker {
  private PVector pos; // Posicion actual del caminante
  private color Color;

  public Walker(Matrix m) {
    int x = int(random(m.cols)); // aleatoria dentro de la matriz
    int y = int(random(m.rows)); // aleatoria dentro de la matriz
    this.pos = new PVector(x, y); // posicion aleatoria dentro de la matriz
    this.Color = color(0, 0, 255, 100);
  }

  public void move(Matrix matrix) {
    int dir = int(random(4)); // 0: arriba, 1: derecha, 2: abajo, 3: izquierda
    PVector newPos = pos.copy();

    switch (dir) {
      case 0: newPos.y--; break; // Mover hacia arriba
      case 1: newPos.x++; break; // Mover hacia la derecha
      case 2: newPos.y++; break; // Mover hacia abajo
      case 3: newPos.x--; break; // Mover hacia la izquierda
    }

    // Verificando que las nuevas coordenadas esten dentro de los limites de la matriz
    if (newPos.x >= 0 && newPos.x < matrix.getCols() && newPos.y >= 0 && newPos.y < matrix.getRows()) {
      
      // << operador de desplazamiento, desplaza los bits hacia la izquierda segun la direccion de desplazamiento
      int binaryValue = 1 << dir; // Calcular el valor binario segun la direccion
      int reverseBinaryValue = 1 << (dir + 2) % 4; // Calcular el valor binario de la direccion opuesta

      // Actualizando los valores de la matriz
      matrix.addValue(pos, newPos, binaryValue, reverseBinaryValue);

      // Mover el caminante a la nueva posicion
      this.pos = newPos.copy();

      display();
    }

    // Si el numero de elementos no ceros es igual al objetivo, detener el bucle draw()
    if (matrix.nonZeroCount() >= indexNonZero) {
      noLoop();
      println("Matriz completada con " + matrix.nonZeroCount() + " elementos diferentes de cero:");
      matrix.printMatrix();
      matrix.display();
      setColor(color(255,0,0,100));
      display();
    }
  }

  public void display() {
    // Resaltar la posicion actual del caminante
    fill(Color);
    noStroke();
    rect(pos.x * cellSize, pos.y * cellSize, cellSize, cellSize);
  }

  /* -- ASESORES -- */
  public void setColor(color Color) {  this.Color = Color;  }
  public PVector getCurrentPos() {
    return pos;
  }
}
