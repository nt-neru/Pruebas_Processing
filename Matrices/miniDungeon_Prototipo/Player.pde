
class Player {
  float x, y, radius;
  int speed;
  int col, row; // columans y filas en donde esta parado el jugador con respecto a la matriz

  Player(float x, float y, float radius, int speed) {
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

  public void updatePosition(int newCol, int newRow, float newX, float newY) {
    col = newCol;
    row = newRow;
    x = newX;
    y = newY;
  }

  void checkCollisions(Room roomActual) { // hay que optimizarlo
    // si en la habitacion actual no hay puertas salir asi no consumir recursos
    if (roomActual.hasDoors() == false) return;

    for (Door door : roomActual.doorList) {
      if (door != null && door.isColliding(this)) { // correccion de error por si la puerta no existia
        //si la proxima habitacion en el rango de la matriz continuar
        if (door.direction == "UP" && dungeon.getRoom(col, row - 1) != null) {
          updatePosition(col, row-1, door.x, door.y-radius); return;
        } else if (door.direction == "DOWN"  && dungeon.getRoom(col, row + 1) != null) {
          updatePosition(col, row+1, door.x, door.y+radius); return;
        } else if (door.direction == "LEFT"  && dungeon.getRoom(col -1, row) != null) {
          updatePosition(col-1, row, door.x-radius, door.y);return;
        }
        else if (door.direction == "RIGHT"  && dungeon.getRoom(col+1, row) != null) {
          updatePosition(col+1, row, door.x+ radius , door.y);return;
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
