class Wall extends GameObject{
  private Collider collider;

  public Wall(PVector posicion, int ancho, int alto){
    super(posicion, ancho, alto);
    this.collider = new Collider(this.posicion, this.ancho, this.alto);
  }
  
  /* -- METODOS -- */
  public void display(){
    collider.displayRect(#20C618);
  }
  
  public Collider getCollider(){
    return this.collider;
  }
}
