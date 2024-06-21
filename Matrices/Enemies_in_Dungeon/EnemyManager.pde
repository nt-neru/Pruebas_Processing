/** Gestiona los estados de los enemigos*/
class EnemyManager {
  /** representa a los enemigos de una habitacion*/
  private ArrayList<Enemy> enemies;
  /***/
  private boolean[] enemigosGenerados;

  public EnemyManager() {
    enemies= new ArrayList();
    enemigosGenerados = new boolean[8]; // por defecto se inicializan en falso
  }

  public void createEnemies(Room room) {
    removeEnemies();
    // Verificar si los enemigos ya han sido generados para esta habitación
    if (enemigosGenerados[room.getNameRoom() ]) { // nameRoom - 1 porque los índices en el array comienzan desde 0
      return; // Salir si ya han sido generados
    }
    generarFormacion(room.getNameRoom());
    room.stateDoors(false);
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
          enemies.add(e);
        }
        break;
      }
    case 2:
      {// en la habitacion 2
        int cantidadEnemies = 4;
        for (int i=0; i<cantidadEnemies; i++) {
          e= new Enemy();
          e.setPosicion(new PVector((i+1)*width/(cantidadEnemies+1), height/4));
          enemies.add(e);
        }
        break;
      }

    default:
      // sin enemigos
      break;
    }//end Switch
    // Marcar la habitación como generada
    enemigosGenerados[nameRoom - 1] = true; // nameRoom - 1 porque los índices en el array comienzan desde 0
  }

  /** Dibuja a los enemigos */
  public void display() {
    for (Enemy e : enemies) {
      e.display();
    }
  }
  
  public void checkEnemyCollision(Player jugador){
    for(int i = enemies.size() -1; i>=0; i--){
      Enemy enemy = enemies.get(i);
      if(enemy.collider(jugador)){
        enemies.remove(i);
      }
    }
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
