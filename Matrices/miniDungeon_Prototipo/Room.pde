
class Room {
  int doors;  // Representa las posiciones de las puertas en binario
  float x, y, size;
  Door[] doorList; // lista de puertas que tiene la room
  
  Room(int doors, float x, float y, float size) {
    this.doors = doors;
    this.x = x;
    this.y = y;
    this.size = size;
    doorList = new Door[4];
    generateDoors();
  }
  
  void generateDoors() { // Logrado!!! reduci mucho codigo con esto T_T
    // si hay puertas genera una en la posicion del vector :D y lugar, sino la dejara en null
    // Coprobacion AND bit a bit para saber si hay una puerta en X direccion
    if ((doors & 1) != 0) doorList[0] = new Door(x + size / 2, y, "UP");
    if ((doors & 2) != 0) doorList[1] = new Door(x + size, y + size / 2, "RIGHT");
    if ((doors & 4) != 0) doorList[2] = new Door(x + size / 2, y + size, "DOWN");
    if ((doors & 8) != 0) doorList[3] = new Door(x, y + size / 2, "LEFT");
    
    // internamente compara los bits de un numero con otro esto se explica mejor en el word
  }
  
  void display() {
    stroke(0);
    noFill();
    rect(x, y, size, size);
    for (Door door : doorList) {
      if (door != null) door.display(); // si la puerta existe la dibuja
    }
  }
  boolean hasDoors() { // hay una puerta? si la hay devuelve true caso contrario false
    for (Door door : doorList) {
      if (door != null) return true;
    }
    println("no hay puertas :c");
    return false;
  }
}
