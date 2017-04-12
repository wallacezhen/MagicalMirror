
// mirror size information
Mirror mainMirror;
int MIRROR_WIDTH = 1280;
int MIRROR_HEIGHT = 700;

// icon size information
int ICON_OFFSET = MIRROR_WIDTH/4;
int ICON_SIZE = MIRROR_WIDTH/4/6;

// color selected at the moment
int BLACK = 10, BROWN = 11, RED = 12, BLUE = 13, YELLOW = 14;
int COLOR = BROWN;

// language selected at the moment
int ENGLISH = 1, CHINESE = 2;
int LANGUAGE = ENGLISH;

// selected window at the moment (related to ACCESSABLE_BUTTONS_ON_WINDOW), -1 mean none
int ON_WINDOW = -1;


int BUTTONX = ICON_SIZE;
int BUTTONY = ICON_SIZE;
// all buttons that are accessable on the main screen
int[][] ACCESSABLE_BUTTONS_ON_WINDOW = {

  // four app icons
  {ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8*6 + ICON_SIZE}, // weather
  {ICON_OFFSET+ICON_SIZE*2, MIRROR_HEIGHT/8*6 + ICON_SIZE}, // calendar
  {ICON_OFFSET+ICON_SIZE*3, MIRROR_HEIGHT/8*6 + ICON_SIZE}, // health
  {ICON_OFFSET+ICON_SIZE*4, MIRROR_HEIGHT/8*6 + ICON_SIZE}, // media
  // three in app icons 
  {ICON_OFFSET+ICON_SIZE*2, MIRROR_HEIGHT/8*5 + ICON_SIZE}, // app icon 1
  {ICON_OFFSET+ICON_SIZE*3, MIRROR_HEIGHT/8*5 + ICON_SIZE}, // app icon 2
  {ICON_OFFSET+ICON_SIZE*4, MIRROR_HEIGHT/8*5 + ICON_SIZE}, // app icon 3
  

  // music player backtrack, playpause and forward
  {1020,580}, {1135, 300}, {1135, 380},
  // music player volumn up and down
  {1135, 530}, {1135, 580}, 
  // music player song list icon and actually list
  {972, 700}, {1100, 700},


  // more: triangle icon, lock and more list pop-up
  {},{},{} 
};

void setup(){
  mainMirror = new Mirror();

  size(1280, 700);
  background(230);
}

void draw() {
  mainMirror.draw();
}

void mouseReleased() {
  boolean hitSomeButton = false;

  for (int loopCounter=0; loopCounter < ACCESSABLE_BUTTONS_ON_WINDOW.length; loopCounter++){
      if ((mouseX > ACCESSABLE_BUTTONS_ON_WINDOW[loopCounter][0]) && (mouseX < ACCESSABLE_BUTTONS_ON_WINDOW[loopCounter][0]+BUTTONX)
      && (mouseY > ACCESSABLE_BUTTONS_ON_WINDOW[loopCounter][1]) && (mouseY < ACCESSABLE_BUTTONS_ON_WINDOW[loopCounter][1]+BUTTONY)){
        

        if (loopCounter == 0) {
          // app 1
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 1) {
          // app 2
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 2) {
          // app 3
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 3) {
          // app 4
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 4) {
          // app icon 1
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 5) {
          // app icon 2
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 6) {
          // app icon 3
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } 
        
        
        else if (loopCounter == 7) {
          // player backTrack
        } else if (loopCounter == 8) {
          // player playPause
        } else if (loopCounter == 9) {
          // player forward
        } else if (loopCounter == 10) {
          // player volumnUp
        } else if (loopCounter == 11) {
          // player volumeDown
        } else if (loopCounter == 12) {
          // player songListIcon
        } else if (loopCounter == 13) {
          // player songList
        } 
        
        
        else if (loopCounter == 14) {
          // more
        } else if (loopCounter == 15) {
          // lock
        } else if (loopCounter == 16) {
          // more pop-up area
        } 

        
        hitSomeButton = true;
        //ON_WINDOW = loopCounter;
      } 

      else {
      }
      
      
  }

  if (!hitSomeButton) {
    
        ON_WINDOW = -1;
  }
}


//*******************************start main mirror class*******************//

// this is the main Mirror class containing all other elements 
class Mirror {
  Apps apps;
  MusicPlayer musicPlayer;
  More more;
  Info info;

  Mirror() {
    apps = new Apps();
    musicPlayer = new MusicPlayer();
    more = new More();
    info = new Info();
  }

  void draw() {
    apps.draw();
    musicPlayer.draw();
    more.draw();
    info.draw();
  }
}

//*******************************end main mirror class*******************//



//*******************************start apps class*******************//

// class for those four app icons
class Apps{ 
  ImageButton weather;
  ImageButton calendar;
  ImageButton health;
  ImageButton media;

  int onMainIcon = -1;
  int onSubIcon = 0;

  ImageButton[][] englishWindow;
  ImageButton[][] chineseWindow;

  Apps() {

    setupMainIcons();

    setupEnglishWindow();
    setupChineseWindow();

  }

  void setupMainIcons() {
    PImage iconImage = loadImage("power.jpg");
    weather = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "weather");

    iconImage = loadImage("power.jpg");
    calendar = new ImageButton(ICON_OFFSET+ICON_SIZE*2, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "calendar");

    iconImage = loadImage("power.jpg");
    health = new ImageButton(ICON_OFFSET+ICON_SIZE*3, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "health");

    iconImage = loadImage("power.jpg");
    media = new ImageButton(ICON_OFFSET+ICON_SIZE*4, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "media");
  }

  void setupEnglishWindow() {
    englishWindow = new ImageButton[4][3];

    // weather

    PImage appImage = loadImage("english.jpg");
    englishWindow[0][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("english.jpg");
    englishWindow[0][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("english.jpg");
    englishWindow[0][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("english.jpg");
    englishWindow[0][3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

    // calendar

    appImage = loadImage("english.jpg");
    englishWindow[1][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("english.jpg");
    englishWindow[1][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("english.jpg");
    englishWindow[1][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("english.jpg");
    englishWindow[1][3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

    // health
    
    appImage = loadImage("english.jpg");
    englishWindow[2][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("english.jpg");
    englishWindow[2][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("english.jpg");
    englishWindow[2][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("english.jpg");
    englishWindow[2][3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

    // media

    appImage = loadImage("english.jpg");
    englishWindow[3][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("english.jpg");
    englishWindow[3][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("english.jpg");
    englishWindow[3][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("english.jpg");
    englishWindow[3][3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");


  }

  void setupChineseWindow() {
    chineseWindow = new ImageButton[4][3];

    // weather

    PImage appImage = loadImage("chinese.jpg");
    chineseWindow[0][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("chinese.jpg");
    chineseWindow[0][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[0][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[0][3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

    // calendar

    appImage = loadImage("chinese.jpg");
    chineseWindow[1][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("chinese.jpg");
    chineseWindow[1][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[1][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[1][3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

    // health
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[2][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("chinese.jpg");
    chineseWindow[2][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[2][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[2][3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

    // media

    appImage = loadImage("chinese.jpg");
    chineseWindow[3][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("chinese.jpg");
    chineseWindow[3][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[3][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("chinese.jpg");
    chineseWindow[3][3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

  }

  // event handler
  void clicked(int clickedIndex) {
    switch (clickedIndex) {
      case 0 :
        println("weather");
        onMainIcon = 0;
        onSubIcon = 0;
      break;

      case 1 :
        println("calendar");
        onMainIcon = 1;
        onSubIcon = 0;
      break;

      case 2 :
        println("health");
        onMainIcon = 2;
        onSubIcon = 0;
      break;

      case 3 :
        println("media");
        onMainIcon = 3;
        onSubIcon = 0;
      break;

      case 4 :
        println("app icon 1");
        onSubIcon = 0;
      break;

      case 5 :
        println("app icon 2");
        onSubIcon = 1;
      break;

      case 6 :
        println("app icon 3");
        onSubIcon = 2;
      break;

      default:
      //panic!!
    }
  }

  void draw() {
    weather.display();
    calendar.display();
    health.display();
    media.display();

    if (0 <= ON_WINDOW && ON_WINDOW <= 6 && onMainIcon != -1) {
      switch (COLOR) {
        case BLACK:
          fill(0);
        break;

        case BROWN:
          fill(139,69,19);
        break;

        case RED:
          fill(255,69,0);
        break;

        case BLUE:
          fill(30,144,255);
        break;

        case YELLOW:
          fill(255,236,139);
        break;

        default:
          fill(0);

      }
      rect(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8*4, // x and y
      ICON_SIZE*4, ICON_SIZE*4,                        // width and height
      7);;         
      
      if (LANGUAGE == ENGLISH) {
        englishWindow[onMainIcon][onSubIcon].display();
      } else {
        chineseWindow[onMainIcon][onSubIcon].display();
      }
    } else {
      onMainIcon = -1;
      fill(250);
      rect(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8*4, // x and y
      ICON_SIZE*4, ICON_SIZE*4,                        // width and height
      7);;                                             // roundness
    }

  }
  
}

class AppsWindowEnglish {
  int onIcon = 0;
  int onSubIcon = 0;

  ImageButton[] images;
  ImageButton[] buttons;

  AppsWindowEnglish() {
    images = new ImageButton[4];

    PImage appImage = loadImage("english.jpg");
    images[0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("english.jpg");
    images[1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("english.jpg");
    images[2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("english.jpg");
    images[3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

  }

  void draw() {
      images[onIcon].display();
      images[onSubIcon].display();
  }
}

class AppsWindowChinese {
  int onIcon = 0;
  int onSubIcon = 0;

  ImageButton[] images;
  ImageButton[] buttons;

  AppsWindowChinese() {
    images = new ImageButton[4];

    PImage appImage = loadImage("chinese.jpg");
    images[0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("chinese.jpg");
    images[1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("chinese.jpg");
    images[2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("chinese.jpg");
    images[3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

  }

  void draw() {
      images[onIcon].display();
      images[onSubIcon].display();
  }
}

//*******************************end apps class*******************//



//*******************************start music player classes*******************//

// music player, shall we also make a spotify login page?
class MusicPlayer {
  ImageButton backTrack;
  ImageButton playPause;
  ImageButton forward;
  ImageButton volumnUp;
  ImageButton volumnDown;

  ImageButton songList;

  SongListWindow songListWindow;

  MusicPlayer() {
    songListWindow = new SongListWindow();
  }

  void draw() {
    songListWindow.draw();
  }
}

class SongListWindow {
  
  SongListWindow() {

  }

  void draw() {

  }
}

//*******************************end music player classes*******************//


//*******************************start More classes*******************//

// where the account, setting, etc. are 
class More {
  MoreWindow moreWIndow;
  ImageButton[] buttons;

  More() {
    moreWIndow = new MoreWindow();
  }

  void draw() {
    moreWIndow.draw();
  }

}

class MoreWindow {
  
  MoreWindow() {
  
  }

  void draw() {
  
  }
}

class Info {
  InfoTime infoTime;
  InfoDate infoDate;

  Info () {
    infoTime = new InfoTime();
    infoDate = new InfoDate();

  }

  void draw() {
    infoTime.draw();
    infoDate.draw();
  }
}

class InfoTime {
  InfoTime() {

  }

  void draw() {

  }
}

class InfoDate {
  
  InfoDate() {

  }

  void draw() {
  
  }
}

//*******************************end More classes*******************//

class ImageButton {
  String label;
  PImage currentImage;

  int x, y;
  int w, h;

  boolean isPressed = false;

  ImageButton(int ix, int iy, PImage ibase, String ilabel) {
    x = ix;
    y = iy;
    w = ibase.width;
    h = ibase.height;

    label = ilabel;
    currentImage = ibase;
  }

  void pressed() {
    if(mousePressed) {
      isPressed = true;
    } else {
      isPressed = false;
    }    
  }

  String update() {
    pressed();

    if(isPressed) {
      return label;
    } else {
      return null;
    }
  }

  void display() {
    image(currentImage, x, y);
  }
}