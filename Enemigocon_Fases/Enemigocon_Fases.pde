/**Variables Globales--------*/
public boolean W_PRESSED;
public boolean D_PRESSED;
public boolean S_PRESSED;
public boolean A_PRESSED;

Player player;
Boss boss;
GestorBullets gestorDisparos;
void setup() {
  size(800, 600); // Tamaño de la pantalla
  
  player = new Player(new PVector(width/2,400));
  boss = new Boss();
  gestorDisparos = new GestorBullets();
}

void draw() {
  println(frameRate);
  background(0);
  
  //Jugador
  player.display();
  player.mover();
  
  boss.display();
  boss.mover();
  boss.detectarPlayer(player);
  // temporizador para disparar
  //boss.disparar();
  gestorDisparos.updateBullets();
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
