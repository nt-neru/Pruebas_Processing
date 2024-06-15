// Clase que se encarga de crear y gestionar las habitaciones segun el nivel.
class Dungeon {
  private int nivel;
  private int cols, rows; // Número de columnas y filas en la matriz de habitaciones
  private int[][] matriz; // Representa la matriz de la dungeon con enteros para definir las puertas mas adelante
  private Room[][] rooms; // Matriz de las habitaciones que hay en la dungeon
  private int roomSize;  // Tamaño de la habitacion

  public Dungeon(int nivel, int roomSize) {
    this.nivel = nivel;

    this.matriz = startDungeon();
    this.cols = matriz[0].length;
    this.rows = matriz.length;
    this.roomSize = roomSize;
    this.rooms = new Room[this.rows][this.cols];  // Inicialización de las dimenciones de la matriz de habitaciones
    generateRooms();
  }

  public int[][] startDungeon() {
    switch (this.nivel) {
      case 1:
        return new int[][] {
          {2, 14, 12, 0},
          {0, 3, 11, 8}
        };
      case 2:
        return new int[][] {
          {2, 14, 11, 0},
          {0, 3, 15, 8},
          {0, 3, 11, 8}
        };
      default:
        // Valor por defecto si el nivel no está definido.
        return new int[][] {
          {0}
        };
    }
  }

  public void generateRooms() {
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        this.rooms[i][j] = new Room(matriz[i][j], this.roomSize);
      }
    }
  }

  // Devuelve el objeto habitacion segun la columna y fila solicitada dentro del limite de la matriz
  public Room getRoom(int col, int row) {
    if (col >= 0 && col < this.cols && row >= 0 && row < this.rows) {
      return this.rooms[row][col];
    }
    println("Room Inexistente por estar fuera de rango");
    return null;
  }
}
