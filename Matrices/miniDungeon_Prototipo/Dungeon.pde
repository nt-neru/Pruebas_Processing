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
  
  void generateRooms() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        rooms[i][j] = new Room(matriz[i][j], j * roomSize, i * roomSize, roomSize);
      }
    }
  }
  
  void display() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        rooms[i][j].display();
      }
    }
  }
  
  // Debuelve el objeto habitacion segun la columna y fila solicitada dentro del limite de la matriz
  Room getRoom(int col, int row) {
    if (col >= 0 && col < cols && row >= 0 && row < rows) {
      return rooms[row][col];
    }
    println("Room Inexistente por estar fuera de rango");
    return null;
  }
}
