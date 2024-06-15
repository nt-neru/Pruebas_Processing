// -------------------------juego ---------------------//
int[][] prueba = {
  {2, 14, 14, 11},
  {0, 3, 11, 8}
};

int[][] level1 = {
  {2, 14, 12, 0},
  {0, 3, 11, 8}
};
float espacio = 50;
Dungeon dungeon;
Player player;

void setup() {
  size(500, 300);
  dungeon = new Dungeon(prueba, 100);
  player = new Player(dungeon.roomSize/2+espacio, dungeon.roomSize/2+espacio, 20, 15); // Inicia en el centro de la primera habitación
}

void draw() {
  background(255);
  dungeon.display(); // si borra se mostrara solo la room actual
  player.display();
  // si la habitacion actual existe y esta en l rango de la matriz continuar, sino salir para evitar errores
  Room roomActual = dungeon.getRoom(player.col, player.row);
  if (roomActual != null) {
    roomActual.display();
    // Verificar colisiones y actualizar la posición del jugador
    player.checkCollisions(roomActual);          
  }
  displayPlayerPosition();
}

void keyPressed() {
  if (key == 'W' || key == 'w' || key == 'S' || key == 's' || key == 'A' || key == 'a'  || key == 'D' || key == 'd' ) {
    player.move(Character.toLowerCase(key)); // convertir a minusculas
  }
}

void displayPlayerPosition() {
  fill(0);
  textSize(16);
  text(player.getPosition(), 10, 20);
}
