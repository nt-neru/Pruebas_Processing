/**Representa todos los objetos del juego*/
abstract class GameObject{
  /**-------------------------Definicion de Atributos protegidos-------------------------*/
  protected PVector position;
  protected float velocity; 
  protected int radio;
  protected int ancho;
  protected int alto;
  
  /**-------------------------Seccion Constructores-------------------------*/
  
  /** Costructor por defecto*/
  public GameObject(){
    this.position = new PVector();
  }
  
  /**-------------------------Seccion Metodos abstractos-------------------------*/
  public abstract void display();
  
  /**-------------------------Seccion metodos accesores-------------------------*/
  
  /**setters*/
  public void setPosition(PVector position){
    this.position = position;
  }
  public void setVelocity(float velocity){
    this.velocity=velocity;
  }  
  public void setRadio(int radio){
   this.radio=radio; 
  }
  /**getters*/
  public PVector getPosition(){
    return this.position;
  }
  public float getVelocity(){
    return this.velocity;
  }
  public int getRadio(){
    return this.radio;
  }
  
}
