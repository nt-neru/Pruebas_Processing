PVector position; // Posición del personaje
PVector direction; // Dirección del movimiento
float velocity; // Velocidad del personaje
float acceleration = 60; // Aceleración al presionar una tecla
float deceleration = 10; // Desaceleración constante cuando no se presiona una tecla
float maxSpeed = 250; // Velocidad máxima

boolean movingRight = false; // Indicador de movimiento hacia la derecha
boolean movingLeft = false; // Indicador de movimiento hacia la izquierda
boolean movingUp = false; // Indicador de movimiento hacia arriba
boolean movingDown = false; // Indicador de movimiento hacia abajo

void setup() {
  size(800, 600);
  position = new PVector(width / 2, height / 2); // Posición inicial del pj en el centro
  direction = new PVector(0, 0); // Dirección inicial del personaje
  velocity = 0; // Velocidad inicial del personaje
}

void draw() {
  background(255);
  fill(0); // Color pj
  ellipse(position.x, position.y, 50, 50); // Dibujar el pj

  float deltaTime = 1.0 / frameRate; // Calcular deltaTime

  // operador ternario: si lo que esta antes de ? es verdadero entonces acelera : sino desacelera
  velocity = movingRight || movingLeft || movingUp || movingDown ? velocity+acceleration : velocity -deceleration;

  // Verificar si se están presionando las teclas 'a', 'd', 'w' o 's'
  if (movingRight) {
    direction.set(1, 0); // Dirección hacia la derecha
  }
  if (movingLeft) {
    direction.set(-1, 0); // Dirección hacia la izquierda
  }
  if (movingUp) {
    direction.set(0, -1); // Dirección hacia arriba
  }
  if (movingDown) {
    direction.set(0, 1); // Dirección hacia abajo
  }
  if (movingRight && movingDown) {
    direction.set(1, 1);
  }
  if (movingRight && movingUp) {
    direction.set(1, -1);
  }
  if (movingLeft && movingDown) {
    direction.set(-1, 1);
  }
  if (movingLeft && movingUp) {
    direction.set(-1, -1);
  }

  // Limitar la velocidad máxima
  velocity = constrain(velocity, 0, maxSpeed);

  // Actualizar la posición del pj
  PVector velocityVector = direction.normalize().mult(velocity * deltaTime);
  position.add(velocityVector);

  // Mantener al pj dentro de los límites de la pantalla
  position.x = constrain(position.x, 25, width - 25);
  position.y = constrain(position.y, 25, height - 25);

  text("velocidad: " + velocity, 30, 50);
  text("aceleracion: " + acceleration, 30, 90);
}

void keyPressed() {
  if (key == 'd') {
    movingRight = true;
  }
  if (key == 'a') {
    movingLeft = true;
  }
  if (key == 'w') {
    movingUp = true;
  }
  if (key == 's') {
    movingDown = true;
  }
}

void keyReleased() {
  if (key == 'd') {
    movingRight = false;
  }
  if (key == 'a') {
    movingLeft = false;
  }
  if (key == 'w') {
    movingUp = false;
  }
  if (key == 's') {
    movingDown = false;
  }
}
