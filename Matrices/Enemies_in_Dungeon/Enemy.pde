// clase enemy generico
class Enemy extends GameObject{
  protected float speed;
  protected float acceleration;
  protected float topSpeed; 
  protected int lives;
  
  public Enemy(){
    this.posicion = new PVector(random(width-(width/3))+width/6,random(height- (height/2))+height/4);
    this.ancho = 50;
    this.speed = 0;
    this.acceleration = 30;
    this.topSpeed= random(200,400);
    this.lives = 5;
  }
  
  public void display(){
    fill(255,255,0);
    circle(this.posicion.x,this.posicion.y,this.ancho);
    fill(0);
    text(lives,this.posicion.x, this.posicion.y);
  }
  public void move(){
    
    // Operador ternario para acelerar o desacelerar segun si se apreta una tecla
    this.speed = this.speed+acceleration ;

    //this.direccion.display();

    /*if (this.direccion.obtenerMagnitud() != 0) {
      this.direccion.getDestino().normalize(); // Normalizar la dirección para que el movimiento diagonal no sea mas rapido
    }*/
    // Limitar la velocidad
    this.speed = constrain(this.speed, 0, this.topSpeed);

    // Actualizar la posicion del jugador
    //this.posicion.add(this.direccion.getDestino().copy().mult(this.speed * Time.getDeltaTime(frameRate)));

    // Limitar el movimiento del jugador
    this.posicion.x = constrain(this.posicion.x, 0 + this.ancho, width - this.ancho);
    this.posicion.y = constrain(this.posicion.y, 0 + this.ancho, height - this.ancho);
  }
  
  boolean collider(Player jugador){
    float dist = dist(this.posicion.x, this.posicion.y, jugador.posicion.x, jugador.posicion.y);
    return dist < (this.ancho + jugador.ancho )/2;
  }
  
  public int getLives(){
    return lives;
  }
  public void setLives(int lives){
    this.lives=lives;
  }
}
