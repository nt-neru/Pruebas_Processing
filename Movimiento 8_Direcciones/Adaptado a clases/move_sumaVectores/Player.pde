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

    this.direccion = new Vector();
  }

  public void display() {
    fill(200);
    circle(this.position.x, this.position.y, radio*2);

    textSize(50);
    fill(255);
  }
  
  public void move() {
    velocity = W_PRESSED || D_PRESSED || S_PRESSED || A_PRESSED ? velocity+acceleration : velocity-deceleration;
    
    this.direccion.setOrigen(this.position);
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

    text("Aceleracion: "+acceleration, 30, 40);
    text("Velocidad: "+velocity, 30, 80);
    text("this.direccion origen:"+this.direccion.origen,30,130);

    //this.position.x += this.direccion.getDestino().x * velocity * Time.getDeltaTime(frameRate);
    //this.position.y += this.direccion.getDestino().y * velocity * Time.getDeltaTime(frameRate);

    this.position.add(this.direccion.getDestino().mult(velocity * Time.getDeltaTime(frameRate)));
  }

  /**-------------------------Seccion metodos accesores-------------------------*/
  public void setAcceleration(float acceleration) {
    this.acceleration = acceleration;
  }
}
