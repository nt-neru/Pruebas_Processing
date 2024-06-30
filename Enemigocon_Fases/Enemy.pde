class Enemy extends GameObject{
  protected float speed;
  protected float acceleration;
  protected float topSpeed; 
  protected int lives;
  protected Collider collider;
  protected Vector direccion;
  
  public Enemy(){
    this.posicion = new PVector(random(width-(width/3))+width/6,random(height- (height/2))+height/4);
    this.ancho = 50;
    this.speed = 0;
    this.acceleration = 30;
    this.topSpeed= random(100,200);
    this.lives = 5;
    this.collider = new Collider(this.posicion,this.ancho-16);
    this.direccion = new Vector();
  }
  
  public void display(){
    noStroke();
    fill(255,255,0);
    circle(this.posicion.x,this.posicion.y,this.ancho);
    fill(0);
    text(lives,this.posicion.x, this.posicion.y);
    collider.setPosicion(this.posicion);
    collider.displayCircle(0);
  }
}
