// -------------------------juego ---------------------//
int[][] prueba = {
  {2, 14, 11, 0},
  {0, 3, 11, 8}
};

int[][] level1 = {
  {2, 14, 12, 0},
  {0, 3, 11, 8}
};

Dungeon dungeon;
Player player;

void setup() {
  size(500, 400);
  dungeon = new Dungeon(level1, width+1); // Cada habitación ocupará el tamaño de la pantalla
  player = new Player(width / 2, height / 2, 20, 10); // Inicia en el centro de la primera habitación
}

void draw() {
  background(255);
  // habitacion actual
  Room roomActual = dungeon.getRoom(player.col, player.row);
  if (roomActual != null) { // si existe:
    roomActual.display();
    // Verificar colisiones y actualizar la posición del jugador
    player.checkCollisions(roomActual);
  }
  player.display();

  displayPlayerPosition();
}

public void keyPressed() {
  if (key == 'W' || key == 'w' || key == 'S' || key == 's' || key == 'A' || key == 'a'  || key == 'D' || key == 'd' ) {
    player.move(Character.toLowerCase(key)); // comvertir a minusculas 
  }
}

public void displayPlayerPosition() {
  fill(0);
  textSize(16);
  text(player.getPosition(), 10, 20);
}
