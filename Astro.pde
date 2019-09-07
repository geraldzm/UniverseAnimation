abstract class Astro {
  PVector Location;
  float velociMovimientoDegrees;
  direccionesRotacion direccionRot; //SDR, SCDR
  float radio;

  Astro(float radio_, PVector Location_, float velociMovimientoDegrees_, direccionesRotacion direccionRot_) {
    radio = radio_;
    Location = Location_;
    velociMovimientoDegrees = velociMovimientoDegrees_;
    direccionRot = direccionRot_;
  }
  Astro(float radio_, PVector Location_, direccionesRotacion direccionRot_) {
    radio = radio_;
    Location = Location_;
    direccionRot = direccionRot_;
  }
  Astro(float radio_, PVector Location_) {
    radio = radio_;
    Location = Location_;
  }
  Astro(float radio_) {
    radio = radio_;
  }
  Astro() {
  }

  public float getRadio() {
    return radio;
  }
  public direccionesRotacion getDireccion() {
    return direccionRot;
  }
  public float getvelociMovimientoDegrees() {
    return velociMovimientoDegrees;
  }
  public PVector getLocation() {
    return Location;
  }
  public void move() {
    //Location.add(velocidadMovimiento);
  }

  abstract void show();
}

enum direccionesRotacion {
  //SDR: sentido de las manecillas
  //SCDR: sentido contrario de las manecillas
  SDR(1), SCDR(-1);
  private  direccionesRotacion(int a_) {
    a = a_;
  }
  public int getR() {
    return a;
  }
  private int a;
};
