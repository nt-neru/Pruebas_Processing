// -------------------------juego ---------------------//
int[][] prueba = {
  {2, 14, 14, 11},
  {0, 3, 11, 8}
};

int[][] level1 = {
  {2, 14, 12, 0},
  {0, 3, 11, 8}
};

Dungeon dungeon;
Player player;

void setup() {
  size(400, 200);
  dungeon = new Dungeon(prueba, 100);
  player = new Player(50, 50, 20, 15); // Inicia en el centro de la primera habitación
}

void draw() {
  background(255);
  dungeon.display();
  player.display();
  player.checkCollisions(dungeon); // chequea colicion con las paredes y puertas
  displayPlayerPosition();
}

void keyPressed() {
  if (key == 'W' || key == 'w' || key == 'S' || key == 's' || key == 'A' || key == 'a'  || key == 'D' || key == 'd' ) {
    player.move(Character.toLowerCase(key)); // comvertir a minusculas 
  }
}

void displayPlayerPosition() {
  fill(0);
  textSize(16);
  text(player.getPosition(), 10, 20);
}
