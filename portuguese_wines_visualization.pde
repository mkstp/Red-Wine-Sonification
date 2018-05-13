import oscP5.*;
OscP5 oscP5;

String[] imageNames = {
  "alcohol.png",
  "chlorides.png",
  "citric_acid.png",
  "density.png",
  "fixed_acidity.png",
  "free_sulfur_dioxide.png",
  "ph.png",
  "quality.png",
  "residual_sugar.png",
  "sulphates.png",
  "total_sulfur_dioxide.png",
  "volatile_acidity.png"
};

PImage[] wineData = new PImage[imageNames.length];

String img;
int index;

void setup() {
  for (int i=0; i < imageNames.length; i++) {
    String imageName = imageNames[i];
    wineData[i] = loadImage(imageName);
  };
  size(500,400);
  oscP5 = new OscP5(this, 12000);
}

void draw() {
  frameRate(30);
  for (int i=0; i < imageNames.length; i++) {
    if (imageNames[i].equals(img) == true) {
      index = i;
    } 
  }
  image(wineData[index],0,0,width,height);
}

void oscEvent(OscMessage theOscMessage){
  if (theOscMessage.checkAddrPattern("/param")==true) {
    String imgSelect = theOscMessage.get(0).stringValue();
    img = imgSelect + ".png";
    println(img);
  }
}

    
