static class Rect {
  PApplet p;  // Referencia a PApplet para poder dibujar en el lienzo principal
  
  // Metodo estatico para dibujar el rectangulo con bordes redondeados
  static void draw(PApplet p, int x, int y, int w, int h, int r) {
    // Dibujar rectángulo con bordes redondeados
    p.beginShape();
      p.vertex(x + r, y);  // Esquina superior izquierda
      p.vertex(x + w - r, y);  // Esquina superior derecha
      p.bezierVertex(x + w - r/2, y, x + w, y + r/2, x + w, y + r);  // Curva superior derecha
      p.vertex(x + w, y + h - r);  // Esquina inferior derecha
      p.bezierVertex(x + w, y + h - r/2, x + w - r/2, y + h, x + w - r, y + h);  // Curva inferior derecha
      p.vertex(x + r, y + h);  // Esquina inferior izquierda
      p.bezierVertex(x + r/2, y + h, x, y + h - r/2, x, y + h - r);  // Curva inferior izquierda
      p.vertex(x, y + r);  // Esquina superior izquierda
      p.bezierVertex(x, y + r/2, x + r/2, y, x + r, y);  // Curva superior izquierda
    p.endShape(PApplet.CLOSE);
  }
}
