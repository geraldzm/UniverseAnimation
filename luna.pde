public class luna extends Astro {
  planeta Planeta;
  luna(float radio_, PVector Location_, direccionesRotacion direc, planeta Planeta_) {
    super(radio_, Location_, direc);
    Planeta = Planeta_;
  }

  public void show() {
    pushMatrix();
    translate(getLocation().x, getLocation().y, getLocation().z);
    noStroke();
    fill(147, 145, 145);
    sphere(radio*2);
    popMatrix();
  }

  public void move() {
    //se translada al punto de el planeta ya que rota con respecto al punto (0,0)
    pushMatrix();
    translate(Planeta.getLocation().x, Planeta.getLocation().y, Planeta.getLocation().z);

    //formula de distancia entre dos puntos
    //momentanio (esto pretende hacer que gire mas rapido con respecto a su distancia)
    // d=raiz(  (x_2-x_1 )^2 + (y_2-y_1)^2  )
    //*parte A; donde se restan las x y se ponen al cuadrado
    float A =(float) Math.pow((Location.x-Planeta.getLocation().x), 2);
    //*parte B; donde se restan las Y y se ponen al cuadrado
    float B =(float) Math.pow((Location.y-Planeta.getLocation().y), 2 );
    //*parte C; donde se suman las dos partes que estan dentro de una raiz
    float C =(float) Math.sqrt(A+B);
    float D = C/1000;          //nota: buscar una manera mejor de escalar su distancia con su velocidad
    //buscar alguna formula que escale su distancia con la velocidad preferible mente

    float angRotacion = radians(1+D);
    angRotacion *= direccionRot.getR(); 


    Location.rotate(angRotacion);
    popMatrix();
  }
}
