import de.bezier.data.sql.*;

MySQL db;

String publicKey = "9JN8Xv5zn2cr6OJmp1D4";

JSONObject next;

float magnitude;

// Database access:
String username = "root";
String password = "database";  //log into database uni = qwkpU6eD Home = dbpassword
String database = "Quakebase"; // database

String NetworkID = "SJ";
String currentURL;
String baseURL; //http://data.sparkfun.com/output/9JN8Xv5zn2cr6OJmp1D4

int i = 0; // step counter for draw loop ellipses
int f = 1; // step counter for iris data loading
int l = 0; // step counter for 

JSONArray readings;    // STEP ONE LOAD/READ FROM URL  

String[] irisData;
String[] irisDataSplit;

boolean start = false;
boolean blue = false;
boolean orange = false;
boolean green = false;
boolean purple = false;
boolean grey = false;
boolean irisStart = false;

int r; // container for random number
String networkFull;
String stationFull;
String source;
String chooseNet;
String dataSize;
int angle;
float c;
int time;
int delayTime = 600;
int time1;
int delayTime1 = 600;
int time2;
int delayTime2 = 600;
boolean displayType = true;

String station;
String channelX;
String channelY;
String channelZ;
String channelM;
float x;
float y;
float z;

void setup()
{
  size(1280, 720);
  smooth();
  frameRate(24);
  //load Images
  SJstate1 = loadImage("SJstate1.png");
  SJstate2 = loadImage("SJstate2.png");
  OSstate1 = loadImage("OSstate1.png");
  OSstate2 = loadImage("OSstate2.png");
  CPstate1 = loadImage("CPstate1.png");
  CPstate2 = loadImage("CPstate2.png");
  SWstate1 = loadImage("SWstate1.png");
  SWstate2 = loadImage("SWstate2.png");

  IUstate1 = loadImage("IUstate1.png");
  IUstate2 = loadImage("IUstate2.png");

  // Connect to database port
  db = new MySQL( this, "127.0.0.1", database, username, password); // incase port needed; :3307
  db.connect();
}







