
class Player {
  int x, y, radius;
  int speed;
  int col, row; // columans y filas en donde esta parado el jugador con respecto a la matriz
  
  Player(int x, int y, int radius, int speed) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speed = speed;
    this.col = 0;
    this.row = 0;
  }
  
  void display() {
    fill(0, 0, 255);
    ellipse(x, y, radius, radius);
  }
  
  void move(char direction) {
    if (direction == 'w' && y - speed  >= 0) y -= speed;
    if (direction == 's' && y + speed  <= height) y += speed;
    if (direction == 'a' && x - speed  >= 0) x -= speed;
    if (direction == 'd' && x + speed  <= width) x += speed;
  }
  
  void checkCollisions(Dungeon dungeon) { // hay que optimizarlo
    Room roomActual = dungeon.getRoom(col, row);
    
    // si en la habitacion actual no hay puertas salir asi no consumir recursos 
    // si la habitacion actual existe y esta en l rango de la matriz continuar, sino salir para evitar errores
    
    for (Door door : roomActual.doorList) {
      if (door != null && door.isColliding(this)) { // correccion de error por si la puerta no existia
        if (door.direction == "UP") row--;
        if (door.direction == "DOWN") row++;
        if (door.direction == "LEFT") col--;
        if (door.direction == "RIGHT") col++;
        Room nextRoom = dungeon.getRoom(col, row);
        if (nextRoom != null) {
          x = nextRoom.size;
          y = nextRoom.size;
        }
      }
    }
    // Limitando al jugador para que no salga de los limites de la habitacion actual
    if (x - radius / 2 < roomActual.x) x = roomActual.x + radius / 2;
    if (x + radius / 2 > roomActual.x + roomActual.size) x = roomActual.x + roomActual.size - radius / 2;
    if (y - radius / 2 < roomActual.y) y = roomActual.y + radius / 2;
    if (y + radius / 2 > roomActual.y + roomActual.size) y = roomActual.y + roomActual.size - radius / 2;
  }
  
  // devuelve la posicion del jugador con respecto a la matriz
  String getPosition() {
    return "Position: (" + col + ", " + row + ")";
  }
}
