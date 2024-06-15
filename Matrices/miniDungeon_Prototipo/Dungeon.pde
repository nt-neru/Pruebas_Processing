class Dungeon {
  int cols, rows;
  int[][] matriz; // Representa la matriz de la dungeon con enteros para definir las puertas mas adelante
  Room[][] rooms;
  int roomSize;
  
  Dungeon(int[][] nivel, int roomSize) {
    this.cols = nivel[0].length;
    this.rows = nivel.length;
    this.matriz = nivel;
    this.roomSize = roomSize;
    this.rooms = new Room[rows][cols];
    generateRooms();
  }
  
  public void generateRooms() {
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        this.rooms[i][j] = new Room(matriz[i][j], j * this.roomSize+espacio, i * this.roomSize+espacio, this.roomSize);
      }
    }
  }
  
  public void display() {
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        this.rooms[i][j].display();
      }
    }
  }
  
  // Debuelve el objeto habitacion segun la columna y fila solicitada dentro del limite de la matriz
  public Room getRoom(int col, int row) {
    if (col >= 0 && col < cols && row >= 0 && row < rows) {
      return this.rooms[row][col];
    }
    println("Room Inexistente por estar fuera de rango");
    return null;
  }
}
