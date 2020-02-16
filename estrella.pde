class estrella extends Astro {

  planeta[] planetas;

  estrella(float radio_, PVector Location_, int cantPlanetas) {
    super(radio_, Location_);
    planetas = new planeta[cantPlanetas];

    pushMatrix();
    translate(Location.x, Location.y, Location.z);
    for (int i = 0; i < cantPlanetas; i++) {//crea los planetas
      //Reglas para crear planetas: 
      //se crean con respecto al centro del sol
      //los planetas se van a crear a una distancia mayor al radio del sol + 10
      //su locacion va a ser ramdon (opcional)
      //no se va a alegar de el sol mas de 280px
      //su radio no puede ser mayor que el 70% del de el sol
      // la cantidad de lunas no puede ser mayor a 4

      int maxDistancia = 500;
      float planetaR = radio/2;
      int planetaLunas = (int)random(1, 3);//esto es momentaneo

      //este es el minimo permitido para crear un planeta,(Distancia entre su circunferencia + 10px)
      int bordex = (int)(Location.x+radio+10); 
      int bordey = (int)(Location.y+radio+10);
      int bordez = (int)(Location.z+radio+10);
      //se genera la locacion en X y Y (Esto siempre va a ser positivo (Continuar leyendo codigo))
      int planetax = (int)random(bordex, maxDistancia);
      int planetay = (int)random(bordey, maxDistancia);
      int planetaz = (int)random(bordez, maxDistancia);

      //***para hacer que X y Y no sean positivas siempre
      int z = (int)random(2);
      planetax *= z == 0 ?-1:1; 
      z = (int)random(2);
      planetay *= z == 0 ?-1:1; 
      z = (int)random(2);
      planetaz *= z == 0 ?-1:1;
      //--------------------------------------------------
      PVector planetaL = new PVector(planetax, planetay, planetaz);

      //SCDR: sentido contrario de las manecillas 
      //SDR: sentido de las manecillas
      direccionesRotacion  DirecRot = z == 0 ? direccionesRotacion.SCDR : direccionesRotacion.SDR; 
      planetas[i] = new planeta(planetaR, planetaL, planetaLunas, DirecRot, this);
    }
    popMatrix();
  }

  void show() {
    noStroke();
    fill(244, 245, 0);
    sphere( radio*2 );
    // ellipse(Location.x, Location.y, radio*2, radio*2);
    for (planeta e : planetas) {
      e.show();
      e.move();
    }
  }
}
