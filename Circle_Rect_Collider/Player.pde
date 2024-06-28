/** Clase que representa al jugador */
class Player extends GameObject {
  /** Representa la velocidad del jugador */
  private float speed;
  /** Representa la maxima velocidad del jugador */
  private float topSpeed;
  /** Representa la direccion de movimiento del jugador */
  private Vector direccion;
  /** Representa la posicion del jugador con respecto a la dungeon*/
  private int col, row;

  private Collider collider;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Player() {
  }
  /** Constructor parametrizado */
  public Player(PVector posicion) {
    this.posicion = posicion;
    this.ancho = 50;
    this.speed = 0;
    this.topSpeed = 250;
    this.direccion = new Vector("down");
    this.collider = new Collider(this.posicion, this.ancho);
  }

  /* -- METODOS -- */
  /** Metodo que dibuja al jugador en pantalla */
  public void display() {
    stroke(0);
    fill(200, 30);
    circle(this.posicion.x, this.posicion.y, this.ancho);
    textSize(20);
    fill(255);
    collider.setPosicion(this.posicion);
    collider.displayCircle(0);
  }

  public void mover(Room roomActual) {
    text("posicion"+this.posicion, 300, 30);
    this.direccion.setOrigen(this.posicion);

    float acceleration = 60;
    float deceleration = 10;

    // Operador ternario para acelerar o desacelerar según si se aprieta una tecla
    this.speed = W_PRESSED || D_PRESSED || S_PRESSED || A_PRESSED ? this.speed + acceleration : this.speed - deceleration;

    // Verificar si se están presionando las teclas 'w', 'a', 's' o 'd'
    if (W_PRESSED) {
      this.direccion = this.direccion.sumar(new Vector("up"));
    }
    if (S_PRESSED) {
      this.direccion = this.direccion.sumar(new Vector("down"));
    }
    if (A_PRESSED) {
      this.direccion = this.direccion.sumar(new Vector("left"));
    }
    if (D_PRESSED) {
      this.direccion = this.direccion.sumar(new Vector("right"));
    }
    this.direccion.display();

    if (this.direccion.obtenerMagnitud() != 0) {
      this.direccion.getDestino().normalize(); // Normalizar la dirección para que el movimiento diagonal no sea más rápido
    }
    // Limitar la velocidad
    this.speed = constrain(this.speed, 0, this.topSpeed);

    // Actualizar la futura posicion
    PVector nuevaPosicion = this.posicion.copy().add(this.direccion.getDestino().copy().mult(this.speed * Time.getDeltaTime(frameRate)));

    checkCollisionWall(nuevaPosicion, roomActual);
  }

  /** Método para verificar colisiones con las paredes */
  public void checkCollisionWall(PVector nuevaPosicion, Room roomActual) {
    boolean colision = false;

    for (Wall wall : roomActual.wallList) {
      if (wall == null) continue; // No se ejecutara esa iteración y se pasa a la siguiente
      // Verificar colisión en cada dirección
      if (this.collider.isCircRect(new Player(nuevaPosicion), wall)) {
        colision = true;
      }
    }
    // Si no hubo colisión, actualizar la posición del jugador
    if (!colision) { // Esta afuera para no tener problemas con otras paredes
      this.posicion = nuevaPosicion;
    }
  }

  public void checkCollisions(Room roomActual) {
    // Si en la habitacion actual no hay puertas salir
    if (roomActual.hasDoors() == false) return;

    for (Door door : roomActual.doorList) {
      //Si colisiono con una puerta preparar nuevas posiciones
      if (door != null && door.getCollider().isCircle(this) && door.getIsOpen()) {
        int newCol = this.col, newRow = this.row;
        PVector newPos = new PVector(0, 0);
        Door newDoor;
        switch (door.direction) {
        case "UP":
          newRow = row - 1;
          newDoor= new Door("DOWN");
          newPos = new PVector(newDoor.getPosicion().x, newDoor.getPosicion().y - newDoor.getAncho() * 1.05);
          break;
        case "DOWN":
          newRow = row + 1;
          newDoor = new Door("UP");
          newPos = new PVector(newDoor.getPosicion().x, newDoor.getPosicion().y + newDoor.getAncho() * 1.05);
          break;
        case "LEFT":
          newCol = col - 1;
          newDoor = new Door("RIGHT");
          newPos = new PVector(newDoor.getPosicion().x - newDoor.getAncho() * 1.05, newDoor.getPosicion().y );
          break;
        case "RIGHT":
          newCol = col + 1;
          newDoor = new Door("LEFT");
          newPos = new PVector(newDoor.getPosicion().x + newDoor.getAncho()*1.05, newDoor.getPosicion().y );
          break;
        }
        //si la proxima habitacion esta en el rango de la matriz actualizar posiciones
        Room nextRoom = dungeon.getRoom(newCol, newRow);
        if (nextRoom != null) {
          updatePosition(newCol, newRow, newPos);
        }
      }
    }
  }
  // Actualiza la posicion del jugador segun los parametros anteriores
  private void updatePosition(int newCol, int newRow, PVector newPos) {
    this.col = newCol;
    this.row = newRow;
    this.posicion = newPos;
  }

  /* -- ASESORES -- */
  /* Getters */
  /** Devuelve la velocidad maxima del jugador */
  public float getTopSpeed() {
    return this.topSpeed;
  }
  /** Devuelve la velocidad del jugador */
  public float getSpeed() {
    return this.speed;
  }
  /** Devuelve la direccion del jugador */
  public Vector getDireccion() {
    return this.direccion;
  }
  public int getCol() {
    return this.col;
  }
  public int getRow() {
    return this.row;
  }

  public Collider getCollider() {
    return this.collider;
  }

  /* Setters */
  /** Asigna una nueva velocidad maxima al jugador */
  public void setTopSpeed( float topSpeed) {
    this.topSpeed = topSpeed;
  }
}
