/**Variables Globales--------*/
public boolean W_PRESSED;
public boolean D_PRESSED;
public boolean S_PRESSED;
public boolean A_PRESSED;
public int nivel = 2;
public int estadoJuego = 0;

private Dungeon dungeon;
private Player jugador;
private EnemyManager enemies;

public void setup()
{
  size(900, 800);
  dungeon = new Dungeon(nivel);
  jugador = new Player(new PVector(width/2, height/2));
  enemies = new EnemyManager();
}

public void draw()
{
  jugando();
}

void jugando() {
  dungeon.displayRoom(jugador, enemies);
  jugador.display();
  jugador.mover();
  displayPlayerPosition();
  enemies.display();

  //jugador.checkEnemyCollision(enemies.getEnemies());
}

void mostrarMenu() {
  background(0, 0, 128);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("MENU PRINCIPAL", width / 2, height / 2 - 40);
  textSize(16);
  text("Presiona ENTER para jugar", width / 2, height / 2);
}

void mostrarVictoria() {
  background(0, 128, 0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("¡VICTORIA!", width / 2, height / 2 - 40);
  textSize(16);
  text("Presiona ENTER para volver al menú", width / 2, height / 2);
}

void mostrarDerrota() {
  background(128, 0, 0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("DERROTA", width / 2, height / 2 - 40);
  textSize(16);
  text("Presiona ENTER para volver al menú", width / 2, height / 2);
}

boolean jugadorGana() {
  if (jugador.row == 1) {
    return true;
  }
  return false;
}

boolean jugadorPierde() {
  // Comprueba si la columna del jugador es 3
  if (jugador.col == 2) {
    return true;
  }
  return false;
}

public void keyPressed() {
  char input = Character.toLowerCase(key);
  switch (input) { // convierte la tecla a minuscula
  case 'w':
    W_PRESSED = true;
    break;
  case 's':
    S_PRESSED = true;
    break;
  case 'a':
    A_PRESSED = true;
    break;
  case 'd':
    D_PRESSED = true;
    break;
  }
}

void iniciarJuego() {
  // Aqui deberiamos reiniciar el estado del juego
  dungeon = new Dungeon(nivel);
  jugador = new Player(new PVector(width/2, height/2));
}

public void keyReleased() {
  switch (Character.toLowerCase(key)) { // convierte la tecla a minuscula
  case 'w':
    W_PRESSED = false;
    break;
  case 's':
    S_PRESSED = false;
    break;
  case 'a':
    A_PRESSED = false;
    break;
  case 'd':
    D_PRESSED = false;
    break;
  }
}

public void displayPlayerPosition() {
  fill(0);
  textSize(16);
  text("pos: "+jugador.getRow()+ " col "+jugador.getCol(), 10, 20);

  text("name "+dungeon.nameRoom(jugador.getRow(), jugador.getCol()), 50, 50);
}
