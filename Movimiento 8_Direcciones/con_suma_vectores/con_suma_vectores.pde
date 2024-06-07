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
  position = new PVector(width / 2, height / 2); // Posición inicial del pj en el centro de la pantalla
  direction = new PVector(0, 0); // Dirección inicial del pj
  velocity = 0; // Velocidad inicial del pj
}

void draw() {
  background(255);
  fill(0); // Color del pj
  ellipse(position.x, position.y, 50, 50); // Dibujar el pj
  
  float deltaTime = 1.0 / frameRate; // Calcular deltaTime
  
  // Verificar si se están presionando las teclas 'w', 'a', 's' o 'd'
  if (movingRight) {
    direction.add(1, 0); // Dirección hacia la derecha
  }
  if (movingLeft) {
    direction.add(-1, 0); // Dirección hacia la izquierda
  }
  if (movingUp) {
    direction.add(0, -1); // Dirección hacia arriba
  }
  if (movingDown) {
    direction.add(0, 1); // Dirección hacia abajo
  }
  
  // Normalizar la dirección para que el movimiento diagonal no sea mas rapido
  if (direction.mag() != 0) {
    direction.normalize();
  }
  
  /*if (movingRight || movingLeft || movingUp || movingDown) {
    velocity += acceleration;
  } else {
    velocity -= deceleration ;
  }*/
  
  // operador ternario: si lo que esta antes de ? es verdadero entonces acelera : sino desacelera
  velocity = movingRight || movingLeft || movingUp || movingDown ? velocity+acceleration : velocity -deceleration;

  // Limitar la velocidad máxima y mínima
  velocity = constrain(velocity, 0, maxSpeed);

  // Actualizar la posición del pj
  PVector velocityVector = direction.copy().mult(velocity * deltaTime);
  position.add(velocityVector);
  
  // Mantener al pj dentro de los límites de la pantalla
  position.x = constrain(position.x, 25, width - 25);
  position.y = constrain(position.y, 25, height - 25);

  text("Velocidad: " + velocity, 30, 50);
  text("Aceleración: " + acceleration, 30, 70);
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
