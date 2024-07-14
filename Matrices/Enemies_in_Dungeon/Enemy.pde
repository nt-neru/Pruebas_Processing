// Clase Enemy genérico
class Enemy extends GameObject {
  protected float speed;
  protected float acceleration;
  protected float topSpeed; 
  protected int lives;
  /** Representa el area de colision */
  protected Collider collider;
  
  // CoolDown
  protected boolean isInvulnerable;
  protected long cooldownStartTime;
  protected final int COOLDOWN_TIME = 2000; // 2 seg

  public Enemy() {
    this.posicion = new PVector(random(width - (width / 3)) + width / 6, random(height - (height / 2)) + height / 4);
    this.ancho = 50;
    this.speed = 0;
    this.acceleration = 30;
    this.topSpeed = random(200, 400);
    this.lives = 2;
    this.collider = new Collider(this.posicion, this.ancho - 16);
    this.isInvulnerable = false;
    this.cooldownStartTime = 0;
  }

  public void display() {
    noStroke();
    if (this.isInvulnerable) {
      fill(255, 0, 0); // Rojo durante la invulnerabilidad
    } else {
      fill(255, 255, 0); // Color normal
    }
    circle(this.posicion.x, this.posicion.y, this.ancho);
    fill(0);
    text(this.lives, this.posicion.x, this.posicion.y);
    this.collider.setPosicion(this.posicion);
    this.collider.displayCircle(0);

    // Verificar si el tiempo de enfriamiento ha terminado
    if (this.isInvulnerable && millis() - this.cooldownStartTime >= COOLDOWN_TIME) {
      this.isInvulnerable = false;
    }
  }

  public void move() {
    this.speed = this.speed + acceleration;

    // Limitar la velocidad
    this.speed = constrain(this.speed, 0, this.topSpeed);

    // Actualizar la posición del jugador
    this.posicion.x = constrain(this.posicion.x, 0 + this.ancho, width - this.ancho);
    this.posicion.y = constrain(this.posicion.y, 0 + this.ancho, height - this.ancho);
  }

  /* -- ASESORES -- */
  /** Devuelve las vidas del enemigo */
  public int getLives() {
    return this.lives;
  }
  
  /** Devuelve si es invulnerable */
  public boolean getIsInvulnerable() {
    return this.isInvulnerable;
  }

  /** Devuelve el area de colision del enemigo */
  public Collider getCollider() {
    return this.collider;
  }

  public void setLives(int lives) {
    this.lives = lives;
    this.isInvulnerable = true;
    this.cooldownStartTime = millis();    
  }
}
