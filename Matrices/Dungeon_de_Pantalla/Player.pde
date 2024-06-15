class Player {
  private float x, y, radius;
  private int speed;
  private int col, row;

  public Player(float x, float y, float radius, int speed) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.speed = speed;
    this.col = 0;
    this.row = 0;
  }

  public void display() {
    fill(0, 0, 255);
    circle(x, y, radius);
  }

  public void move(char direction) {
    if (direction == 'w' && y - speed - radius / 2 >= 0) y -= speed;
    if (direction == 's' && y + speed + radius / 2 <= height) y += speed;
    if (direction == 'a' && x - speed - radius / 2 >= 0) x -= speed;
    if (direction == 'd' && x + speed + radius / 2 <= width) x += speed;
  }

  public void checkCollisions(Room roomActual) {
    // si en la habitacion actual no hay puertas salir asi no consumir recursos
    if (roomActual.hasDoors() == false) return;

    for (Door door : roomActual.doorList) {// correccion de error por si la puerta no existia
      //si colisiono con una puerta preparar nuevas posiciones
      if (door != null && door.isColliding(this)) {
        int newCol = col, newRow = row;
        float newX = x, newY = y;
        switch (door.direction) {
        case "UP":
          newRow = row - 1;
          newX = width / 2;
          newY = height - radius * 2;
          break;
        case "DOWN":
          newRow = row + 1;
          newX = width / 2;
          newY = radius * 2;
          break;
        case "LEFT":
          newCol = col - 1;
          newX = width - radius * 2;
          newY = height / 2;
          break;
        case "RIGHT":
          newCol = col + 1;
          newX = radius * 2;
          newY = height / 2;
          break;
        }
        //si la proxima habitacion esta en el rango de la matriz actualizar posiciones
        Room nextRoom = dungeon.getRoom(newCol, newRow);
        if (nextRoom != null) {
          updatePosition(newCol, newRow, newX, newY);
        }
      }
    }
  }
  // Actualiza la posicion del jugador segun los parametros anteriores
  private void updatePosition(int newCol, int newRow, float newX, float newY) {
    this.col = newCol;
    this.row = newRow;
    this.x = newX;
    this.y = newY;
  }

  // Devuelve la posicion del jugador con respecto a la matriz
  public String getPosition() {
    return "Position: (" + col + ", " + row + ")";
  }
}
