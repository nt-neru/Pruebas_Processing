/** Gestiona los estados de los enemigos*/
class EnemyManager {
  /** representa a los enemigos de una habitacion*/
  private ArrayList<Enemy> enemies;
  /** Verifica si los enemigos estubieron fueron generados en X room*/
  private boolean[] enemigosGenerados;

  public EnemyManager(int tamanio) {
    this.enemies= new ArrayList();
    this.enemigosGenerados = new boolean[tamanio]; // Por defecto se inicializan en falso
  }

  public void createEnemies(Room room) {
    removeEnemies();
    // Verificar si los enemigos ya han sido generados para esta habitación
    if (this.enemigosGenerados[room.getNameRoom()]) {
      return; // Salir si ya han sido generados
    }
    generarFormacion(room.getNameRoom());
    room.stateDoors(false); // hay enemigos cerrar puertas
  }

  public void generarFormacion(int nameRoom) {
    Enemy e;
    switch(nameRoom) {
    case 3:
      {// en la habitacion 1
        int cantidadEnemies = 3;
        for (int i=0; i<cantidadEnemies; i++) {
          e= new Enemy();
          e.setPosicion(new PVector((i+1)*width/(cantidadEnemies+1), height/2));
          this.enemies.add(e);
        }
        break;
      }
    case 2:
      {// en la habitacion 2
        int cantidadEnemies = 4;
        for (int i=0; i<cantidadEnemies; i++) {
          e= new Enemy();
          e.setPosicion(new PVector((i+1)*width/(cantidadEnemies+1), height/4));
          this.enemies.add(e);
        }
        break;
      }

    default:
      // sin enemigos
      break;
    }//end Switch
    // Marcar la habitación como generada
    this.enemigosGenerados[nameRoom] = true;
  }

  /** Dibuja a los enemigos */
  public void display() {
    for (Enemy e : enemies) {
      e.display();
    }
  }
  /** Evaluar muerte de los enemigos */
  public void checkPlayerCollision(Player jugador){
    if (!hayEnemigos()) return;  // Si no hay enemigos salir
    for(int i = this.enemies.size() -1; i>=0; i--){
      Enemy enemy = enemies.get(i);
      if(enemy.getCollider().isCircle(jugador.getCollider())){
        this.enemies.remove(i);
        return;
      }
    }
  }
  
  /* Devuelve si hay enemigos */
  public boolean hayEnemigos(){
    if(enemies.size() == 0){
      return false;
    }
    return true;
  }
  
  /** Elimina a todos los enemigos de la lista */
  public void removeEnemies() {
    enemies.clear(); // Eliminar los enemigos de la lista
  }

  /* -- ASESORES -- */
  public ArrayList<Enemy> getEnemies() {
    return enemies;
  }
  public int getCantidadEnemies() {
    return enemies.size();
  }
}
