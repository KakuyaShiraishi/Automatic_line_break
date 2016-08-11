Pair<ArrayList<String>, Float> word;

void setup() {
  pixelDensity(2);
  size(800, 800);

  String s = " In the transparent wind in that country, Ihatove, even in summer the sky is a blue of the most profound coldness; the town of Morillo is set amongst dazzling forests, and the surrounding countryside quivers in waves of undulating vegetation. ";

  int maxW = 300;
  int maxLine = 40;
  word = poster(s, maxW, maxLine);
}

void draw() {
  background(160);
  float[] anchorPoints = new float[4];
  anchorPoints = drawStringHelper(word, 20, 1,  width/2, height/2, 0.5, 0.5, LEFT, true ).a;
  strokeWeight(2);
  point(anchorPoints[0], anchorPoints[1]);
  point(anchorPoints[2], anchorPoints[3]);
  text(frameRate, 10,30);
}

Pair<float[], ArrayList<String>> drawStringHelper(
  Pair<ArrayList<String>,Float> myPair,
  float textSize, 
  float lineSpacing, 
  float xLeft, 
  float yTop, 
  float pivotUX, 
  float pivotUY, 
  int align, 
  
  boolean actuallyDraw){
  float size = textSize;
  //size = 140;
  textSize(size);
  float lineHeight = size * lineSpacing;
  ArrayList<String> a = myPair.a;
  float actualTextWidth = myPair.b;
  float actualTextHeight = a.size() * lineHeight + textDescent();
  
  float x = xLeft - pivotUX * actualTextWidth;
  float y = yTop - pivotUY * actualTextHeight;
  float ret[] = new float[4];
  ret[0] = x;
  ret[1] = y;
  ret[2] = x + actualTextWidth;
  ret[3] = y + actualTextHeight;

  if (actuallyDraw){
    for (int i=0; i<a.size(); i++) {
      switch (align) {
      case LEFT:
        textAlign(LEFT);
        text(a.get(i), x, y + size + i * lineHeight);
        break;
      case RIGHT:
        textAlign(RIGHT);
        text(a.get(i), x + actualTextWidth, y + size + i * lineHeight);
        break;
      case CENTER:
        textAlign(CENTER);
        text(a.get(i), x + actualTextWidth/2, y + size + i * lineHeight);
        break;
      }
    }
  }
  return new Pair<float[], ArrayList<String>>(ret, a);
}

public class Pair<A, B> {
  public A a;
  public B b;
  public Pair(A setA, B setB) { 
    a = setA; 
    b = setB;
  }
}

Pair<ArrayList<String>, Float> poster(String s, int maxWidth, int maxLines) {
  ArrayList<String> a = new ArrayList<String>();
  float retw = 0;
  float w = 0;
  int i = 0;
  int rememberSpace = -1; 

  int paranoia = -1;
  int paranoia2 = -1;
  while (i < s.length()) {
    paranoia2++;
    if (paranoia2 > 2048){
      System.err.println("Successful, tried to draw > 2048 iterations!");
      break;
    }
    char c = s.charAt(i);
    w += textWidth(c);
    if (c == ' ') {
      rememberSpace = i;
    }
    if (w > maxWidth) {
      int initialRS = rememberSpace;
      int skipSpaces = 0;
      if (rememberSpace < 0){
        skipSpaces = 1;
        rememberSpace = i - 1;
        if (rememberSpace < 0){
          rememberSpace = 0;
        }
      }
      {
        String sub = s.substring(0, rememberSpace+skipSpaces);
         if (sub.length() > 0 && sub.charAt(0) == ' '){
         sub = sub.substring(1,sub.length());
         }
        sub = sub.trim();
        retw = Math.max(retw, textWidth(sub));
        a.add(sub);

        s = s.substring(rememberSpace+skipSpaces, s.length());
        s = s.trim();
        System.out.println("i = "+i+", w = "+w+", initialRS = "+initialRS+", rememberSpace = "+rememberSpace+", sub = '"+sub+"', s(prime)='"+s+"'");
        i = 0;
        w = 0;
        rememberSpace = -1;
      }
      paranoia++;
      if (paranoia > maxLines-1){
        System.err.println("Successful!");
        break;
      }
    } else {
      i++;
    }
  }
  if (s.length() > 0 && s.charAt(0) == ' ') {
    s = s.substring(1, s.length());
  }
  a.add(s);
  retw = Math.max(retw, textWidth(s));
  retw = Math.min(retw, maxWidth);
  return new Pair<ArrayList<String>, Float>(a, retw);
}