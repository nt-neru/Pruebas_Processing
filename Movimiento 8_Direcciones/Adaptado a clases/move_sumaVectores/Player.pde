class Player extends GameObject {
  private float acceleration;
  private float deceleration;
  private float topSpeed;

  /** Representa la dirreccion de movimiento del jugador */
  private Vector direccion;

  public Player() {
  }

  public Player(PVector position) {
    this.position=position;
    this.radio = 25;
    this.velocity= 0; // este debe ser escaalar
    this.acceleration = 60;
    this.deceleration = 10;
    this.topSpeed = 250;

    this.direccion = new Vector(this.position,"down");
  }

  public void display() {
    fill(200,30);
    circle(this.position.x, this.position.y, radio*2);
    textSize(50);
    fill(255);
  }
  
  public void move() {
    velocity = W_PRESSED || D_PRESSED || S_PRESSED || A_PRESSED ? velocity+acceleration : velocity-deceleration;
    
    if (W_PRESSED) {
      this.direccion = this.direccion.sumar(new Vector(this.position, "up"));
    }
    if (S_PRESSED) {
      this.direccion = this.direccion.sumar(new Vector(this.position, "down"));
    }
    if (A_PRESSED) {
      this.direccion = this.direccion.sumar(new Vector(this.position, "left"));
    }
    if (D_PRESSED) {
      this.direccion = this.direccion.sumar(new Vector(this.position, "right"));
    }

    this.direccion.display();
    if (this.direccion.obtenerMagnitud() != 0) {
      this.direccion.getDestino().normalize(); //normalizar la this.direccion para que no valla muy rapido en la suma
    }
    // Limitar la velocidad
    velocity = constrain(velocity, 0, topSpeed);

    //this.position.x += this.direccion.getDestino().x * velocity * Time.getDeltaTime(frameRate);
    //this.position.y += this.direccion.getDestino().y * velocity * Time.getDeltaTime(frameRate);

    // Usando copy porque sino me cambia la direccion
    this.position.add(this.direccion.getDestino().copy().mult(velocity * Time.getDeltaTime(frameRate)));
    
    text("Aceleracion: "+acceleration, 30, 40);
    text("Velocidad: "+velocity, 30, 80);
    text("this.direccion origen:"+this.direccion.destino,30,130);

  }

  /**-------------------------Seccion metodos accesores-------------------------*/
  public void setAcceleration(float acceleration) {
    this.acceleration = acceleration;
  }
}
