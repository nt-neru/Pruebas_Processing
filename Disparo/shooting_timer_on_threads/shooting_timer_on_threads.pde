// Problema: hay como un retardo mas grande entra el primer disparo y el segundo esto se debe a que
//           se ejecuta en otro hilo :c

Player player;
GestorBalas gestorBalas;

float deltaTime;

void setup() {
  size(800, 600);
  player = new Player(new PVector(width/2, height/2), 30);
  gestorBalas = new GestorBalas();
}

void draw() {
  deltaTime = 1.0/frameRate;
  background(0);
  player.dibujarNave();
  gestorBalas.moverYMostrarBalas();
}

void keyPressed() {
  char keyLower = Character.toLowerCase(key);
  if (keyLower == 'w') {
    player.disparar(gestorBalas, "up");
  }
  else if (keyLower == 's') {
    player.disparar(gestorBalas, "down");
  }
  else if (keyLower == 'a') {
    player.disparar(gestorBalas, "left");
  }
  else if (keyLower == 'd') {
    player.disparar(gestorBalas, "right");
  }
}
