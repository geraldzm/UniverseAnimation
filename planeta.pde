class planeta extends Astro {
  // idea hacer que dejen un rastro, como una linea, para que se forme una orbita
  //y que tenga un metodo que lo ponga y lo quite
  estrella sol;
  luna[] lunas;
  planeta(float radio_, PVector Location_, int cantLunas, direccionesRotacion direc, estrella sol_) {
    super(radio_, Location_, direc);
    sol = sol_;
    lunas = new luna[cantLunas];
    //ver la primera rega de las lunas abajo para saber porque se hace el translate
    pushMatrix();
    translate(Location.x, Location.y, Location.z);
    for (int i = 0; i < cantLunas; i++) {//crea los lunas
      //Reglas para crear lunas: 
      //se crean con respecto al centro del planeta
      //las lunas se van a crear a una distancia mayor ala circunferencia del planeta + 5
      //su locacion va a ser ramdon (opcional)
      //no se va a alegar de el planeta mas de 30px
      //su radio no puede ser mayor que el 50% del de el planeta

      int maxDistancia = 30;
      float lunaR = radio/2;

      //este es el minimo permitido para crear una luna,(Distancia entre su circunferencia + 5px)
      int bordex = (int)(radio+5); 
      int bordey = (int)(radio+5);
      int bordez = (int)(radio+5);

      //se genera la locacion en X y Y (Esto siempre va a ser positivo (Continuar leyendo codigo))
      int lunax = (int)random(bordex, maxDistancia);
      int lunay = (int)random(bordey, maxDistancia);
      int lunaz = (int)random(bordez, maxDistancia);
      //***para hacer que X y Y no sean positivas siempre
      int z = (int)random(2);
      lunax *= z == 0 ?-1:1; 
      z = (int)random(2);
      lunay *= z == 0 ?-1:1; 
      z = (int)random(2);
      lunaz*= z == 0 ?-1:1; 
      //--------------------------------------------------

      PVector lunaL = new PVector(lunax, lunay, lunaz);
      //SCDR: sentido contrario de las manecillas 
      //SDR: sentido de las manecillas
      direccionesRotacion  DirecRot = z == 0 ? direccionesRotacion.SCDR : direccionesRotacion.SDR;
      lunas[i] = new luna(lunaR, lunaL, DirecRot, this);
    }
    popMatrix();
  }
  void show() {
    pushMatrix();
    translate(getLocation().x, getLocation().y, getLocation().z);
    noStroke();
    fill(10, 104, 201);
    sphere(radio*2);
    for (luna e : lunas) {
      e.move();
      e.show();
    }
    popMatrix();
  }

  //quiero que esto rote con respecto a un punto
  public void move() {
    pushMatrix();
    translate(sol.getLocation().x, sol.getLocation().y, sol.getLocation().z);
    //formula de distancia entre dos puntos
    //momentanio (esto pretende hacer que gire mas rapido con respecto a su distancia)
    // d=raiz(  (x_2-x_1 )^2 + (y_2-y_1)^2  )
    //*parte A; donde se restan las x y se ponen al cuadrado
    float A =(float) Math.pow((Location.x-sol.getLocation().x), 2);
    //*parte B; donde se restan las Y y se ponen al cuadrado
    float B =(float) Math.pow((Location.y-sol.getLocation().y), 2 );
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
