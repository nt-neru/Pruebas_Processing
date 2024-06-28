/** Clase que representa las habitaciones de la dungeon */
class Room extends GameObject {
  /** Representa las posiciones de las puertas en binario */
  private int posDoors;
  /** Representa la lista de puertas que tiene la habitacion */
  private Door[] doorList;
  /** Representa el nombre de la habitacion */
  private int nameRoom;
  /** Representa la lista de paredes que tiene la habitacion */
  private Wall[] wallList;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Room() {
  }
  /** Constructor parametrizado */
  public Room(int doors, int ancho, int alto, PVector posicion, int name) {
    super(posicion, ancho, alto);
    this.posDoors = doors;
    this.nameRoom = name;
    this.doorList = new Door[4];
    this.wallList = new Wall[4];
    createDoors();
    createWalls();
  }
  /* -- METODOS -- */
  /** Metodo que genera las puertas segun el numero de la matriz sus binarios */
  public void createDoors() {
    // Comprobacion AND bit a bit para saber si hay una puerta en X direccion
    // Se comparan los bits del valor de la matriz con otro para limpiar bits
    if ((this.posDoors & 1) != 0) this.doorList[0] = new Door(new PVector(width / 2, 0), "UP");
    if ((this.posDoors & 2) != 0) this.doorList[1] = new Door(new PVector(width, height / 2), "RIGHT");
    if ((this.posDoors & 4) != 0) this.doorList[2] = new Door(new PVector(width / 2, height), "DOWN");
    if ((this.posDoors & 8) != 0) this.doorList[3] = new Door(new PVector(0, height / 2), "LEFT");
  }
  
  public void createWalls(){
    this.wallList[0] = new Wall(new PVector(200,200), 200, 200);
    //this.wallList[1] = new Wall(new PVector(0,height-60), width, 60);
    //this.wallList[2] = new Wall(new PVector(0,0), 60, height);
    //this.wallList[3] = new Wall(new PVector(width-60, 0), 60, height);
  }

  /** Metodo que dibuja a la puerta */
  public void display() {
    noStroke();
    fill(170);
    rect(-1, -1, ancho, alto);
    for (Door door : this.doorList) {
      if (door != null) door.display();
    }
    for (Wall wall : this.wallList) {
      if (wall != null) wall.display();
    }
  }
  
  /** Metodo que devuelve si hay puertas en la habitacion*/
  public boolean hasDoors() {
    for (Door door : this.doorList) {
      if (door != null) return true; // verifica si el objeto door no es null.
    }
    println("no hay puertas!! estas encerrado!! >:3");
    return false;
  }

  /** Metodo que verifica y actualiza el estado de las puertas*/
  public void updateDoors(boolean hayEnemies){
    if(!hayEnemies){
      stateDoors(true);
    }
  }
  /** Metodo que cierra o abre las puertas */
  public void stateDoors(boolean state) {
    for (Door door : this.doorList) {
      if (door != null) {
        door.setIsOpen(state);
      }
    }
  }

  /* -- ASESORES -- */
  public void setNameRoom(int name) {
    this.nameRoom = name;
  }
  public int getNameRoom() {
    return this.nameRoom;
  }
}
