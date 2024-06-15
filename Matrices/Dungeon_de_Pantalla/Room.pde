// clase que representa las habitaciones de la dungeon
class Room {
  private int doors; // Representa las posiciones de las puertas en binario
  private int size;  // tamaño de la habitacion
  private Door[] doorList; // lista de puertas que tiene la room
  
  public Room(int doors, int size) {
    this.doors = doors;
    this.size = size;
    doorList = new Door[4];
    generateDoors();
  }
  
  public void generateDoors() { // Logrado!!! reduci mucho codigo con esto T_T
    // si hay puertas genera una en la posicion del vector :D y lugar, sino la dejara en null
    // Comprobacion AND bit a bit para saber si hay una puerta en X direccion
    if ((doors & 1) != 0) doorList[0] = new Door(width / 2, 0, "UP");
    if ((doors & 2) != 0) doorList[1] = new Door(width, height / 2, "RIGHT");
    if ((doors & 4) != 0) doorList[2] = new Door(width / 2, height, "DOWN");
    if ((doors & 8) != 0) doorList[3] = new Door(0, height / 2, "LEFT");
    
    // internamente compara los bits de un numero con otro esto se explica mejor en el word
  }
  
  public void display() {
    stroke(0);
    noFill();
    rect(-1, -1, size, size);
    for (Door door : doorList) {
      if (door != null) door.display();
    }
  }
  public boolean hasDoors() { // hay una puerta? si la hay devuelve true caso contrario false
    for (Door door : doorList) {
      if (door != null) return true; // verifica si el objeto door no es null.
    }
    println("no hay puertas :c");
    return false;
  }
}
