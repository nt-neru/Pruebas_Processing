class Boss extends Enemy {
  private boolean inCenter = true;
  private float tiempoInicio;
  private float tiempoProximoDisparo;

  public Boss() {
    this.posicion = new PVector(width/2, 50);
    this.ancho = 120;
    this.direccion = new Vector(random(2) < 1 ? "right" : "left");
    this.collider = new Collider(this.posicion, this.ancho-40);
    this.tiempoInicio = millis();
    this.tiempoProximoDisparo = millis() + int(random(4000, 6000));
  }
  public void display() {
    noStroke();
    fill(255, 255, 255);
    circle(this.posicion.x, this.posicion.y, this.ancho);
    fill(0);
    text(lives, this.posicion.x, this.posicion.y);
    collider.setPosicion(this.posicion);
    collider.displayCircle(0);
    this.direccion.display();
    this.direccion.setOrigen(posicion);
  }
  public void mover() {
    if (inCenter) {
      if (millis() - tiempoInicio > 2000) {
        inCenter = false;
      }
    } else if (!inCenter) {
      moverFase();
      if (millis() > tiempoProximoDisparo) {
        disparar();
        tiempoProximoDisparo = millis() + int(random(3000, 6000));
      }
    }
  }

  public void moverFase() {
    if (this.direccion.obtenerMagnitud() != 0) {
      this.direccion.normalizar();
    }
    this.posicion.add(this.direccion.getDestino().copy().mult(this.topSpeed * Time.getDeltaTime(frameRate)));
    checkCollicionWall();
  }

  public void checkCollicionWall() {
    if ( this.posicion.x < 0 + this.ancho/2 || this.posicion.x > width - this.ancho/2) {
      this.direccion.getDestino().x *= -1;
      resetSpeed();
    }
  }
  public void disparar() {
    int numBalas = int(random(4, 8)); // Número aleatorio de balas entre 4 y 7
    for (int i = 0; i < numBalas; i++) {
      float angulo = PI / 2 + radians(40) / (numBalas - 1) * i - radians(20); // Ajustar los ángulos para las balas
      Bullet bala;
      bala = new Bullet(this.posicion.copy(), angulo);
      gestorDisparos.addBullet(bala);
    }
  }

  public void detectarPlayer(Player player) {
    //area de deteccion dibujada
    noFill();
    stroke(200);
    rect(0, 0, width, 100);

    if (player.getPosicion().y < 100) {
      if (this.posicion.dist(player.getPosicion()) < 1000) {
        fill(255);
        embestir(player);
        checkCollitionPlayer(player);
      }
    }
  }
  public void embestir(Player player) {
    PVector newDireccion = new PVector(player.posicion.x - this.posicion.x, 0).normalize();
    this.topSpeed = 500; // Velocidad de la embestida
    this.direccion.setDestino(newDireccion);
  }

  public void checkCollitionPlayer(Player player) {
    if (collider.isCircle(player)) {
      text("HAY COLICION ", 30, 400);
      if(this.posicion.x - player.posicion.x < 1){
        this.direccion.setDestino(new PVector(random(2) < 1 ? 1 : -1, 0).normalize());
        resetSpeed();
      }
    }
  }

  public void resetSpeed() {
    this.topSpeed= random(100, 200);
  }
}
