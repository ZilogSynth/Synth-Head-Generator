#include "AudioTools.h"
#include <FastLED.h>

#define DATA_PIN 2
#define NUM_LEDS 128


CRGB leds[NUM_LEDS];
AudioInfo info(44100, 2, 16);
I2SStream i2s;
StreamCopy copier(i2s, i2s); // copies sound into i2s
char displayState;

void blankLeds() {
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = CRGB::Black;
  }
  FastLED.show();
}

void setLedsToStandard() {
  displayState = 'A';
  // RIGHT                               LEFT
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |      
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    | 89| 90| 91| 92|   |   |           |   |   | 35| 36| 37| 38|   
  // 103|102|101|100| 99|   | 97|           | 30|   | 28| 27| 26| 25| 24 
  // 104|105|106|107|108|   |110|           | 17|   | 19| 20| 21| 22| 23 
  // 119|118|117|116|115|   |113|112      15| 14|   | 12| 11| 10| 9 | 8
  //    |121|122|123|124|125|126|127      0 | 1 | 2 | 3 | 4 | 5 | 6 |  

  leds[89] = CRGB::OrangeRed;
  leds[90] = CRGB::OrangeRed;
  leds[91] = CRGB::OrangeRed;
  leds[92] = CRGB::OrangeRed;

  leds[103] = CRGB::OrangeRed;
  leds[102] = CRGB::OrangeRed;
  leds[101] = CRGB::OrangeRed;
  leds[100] = CRGB::OrangeRed;
  leds[99] = CRGB::OrangeRed;
  leds[97] = CRGB::OrangeRed;

  leds[104] = CRGB::OrangeRed;
  leds[105] = CRGB::OrangeRed;
  leds[106] = CRGB::OrangeRed;
  leds[107] = CRGB::OrangeRed;
  leds[108] = CRGB::OrangeRed;
  leds[110] = CRGB::OrangeRed;

  leds[119] = CRGB::OrangeRed;
  leds[118] = CRGB::OrangeRed;
  leds[117] = CRGB::OrangeRed;
  leds[116] = CRGB::OrangeRed;
  leds[115] = CRGB::OrangeRed;
  leds[113] = CRGB::OrangeRed;
  leds[112] = CRGB::OrangeRed;

  leds[121] = CRGB::OrangeRed;
  leds[122] = CRGB::OrangeRed;
  leds[123] = CRGB::OrangeRed;
  leds[124] = CRGB::OrangeRed;
  leds[125] = CRGB::OrangeRed;
  leds[126] = CRGB::OrangeRed;
  leds[127] = CRGB::OrangeRed;

  leds[35] = CRGB::OrangeRed;
  leds[36] = CRGB::OrangeRed;
  leds[37] = CRGB::OrangeRed;
  leds[38] = CRGB::OrangeRed;

  leds[30] = CRGB::OrangeRed;
  leds[28] = CRGB::OrangeRed;
  leds[27] = CRGB::OrangeRed;
  leds[26] = CRGB::OrangeRed;
  leds[25] = CRGB::OrangeRed;
  leds[24] = CRGB::OrangeRed;

  leds[17] = CRGB::OrangeRed;
  leds[19] = CRGB::OrangeRed;
  leds[20] = CRGB::OrangeRed;
  leds[21] = CRGB::OrangeRed;
  leds[22] = CRGB::OrangeRed;
  leds[23] = CRGB::OrangeRed;

  leds[15] = CRGB::OrangeRed;
  leds[14] = CRGB::OrangeRed;
  leds[12] = CRGB::OrangeRed;
  leds[11] = CRGB::OrangeRed;
  leds[10] = CRGB::OrangeRed;
  leds[9] = CRGB::OrangeRed;
  leds[8] = CRGB::OrangeRed;

  leds[0] = CRGB::OrangeRed;
  leds[1] = CRGB::OrangeRed;
  leds[2] = CRGB::OrangeRed;
  leds[3] = CRGB::OrangeRed;
  leds[4] = CRGB::OrangeRed;
  leds[5] = CRGB::OrangeRed;
  leds[6] = CRGB::OrangeRed;
  FastLED.show();
}

void setLedsToHeart() {
  // RIGHT                              // LEFT
  //    |   | 69| 68|   | 66| 65|       //    | 62| 61|   | 59| 58|   |   
  //    | 73| 74| 75| 76| 77| 78| 79    //  48| 49| 50| 51| 52| 53| 54|      
  //    | 86| 85| 84| 83| 82| 81| 80    //  47| 46| 45| 44| 43| 42| 41|   
  //    | 89| 90| 91| 92| 93| 94| 95    //  32| 33| 34| 35| 36| 37| 38|   
  //    |   |101|100| 99| 98| 97|       //    | 30| 29| 28| 27| 26|   |    
  //    |   |106|107|108|109|110|       //    | 17| 18| 19| 20| 21|   |    
  //    |   |   |116|115|114|   |       //    |   | 13| 12| 11|   |   |  
  //    |   |   |   |124|   |   |       //    |   |   | 3 |   |   |   |  

  leds[62] = CRGB::OrangeRed;
  leds[61] = CRGB::OrangeRed;
  leds[59] = CRGB::OrangeRed;
  leds[58] = CRGB::OrangeRed;
  leds[48] = CRGB::OrangeRed;
  leds[49] = CRGB::OrangeRed;
  leds[50] = CRGB::OrangeRed;
  leds[51] = CRGB::OrangeRed;
  leds[52] = CRGB::OrangeRed;
  leds[53] = CRGB::OrangeRed;
  leds[54] = CRGB::OrangeRed;
  leds[47] = CRGB::OrangeRed;
  leds[46] = CRGB::OrangeRed;
  leds[45] = CRGB::OrangeRed;
  leds[44] = CRGB::OrangeRed;
  leds[43] = CRGB::OrangeRed;
  leds[42] = CRGB::OrangeRed;
  leds[41] = CRGB::OrangeRed;
  leds[32] = CRGB::OrangeRed;
  leds[33] = CRGB::OrangeRed;
  leds[34] = CRGB::OrangeRed;
  leds[35] = CRGB::OrangeRed;
  leds[36] = CRGB::OrangeRed;
  leds[37] = CRGB::OrangeRed;
  leds[38] = CRGB::OrangeRed;
  leds[30] = CRGB::OrangeRed;
  leds[29] = CRGB::OrangeRed;
  leds[28] = CRGB::OrangeRed;
  leds[27] = CRGB::OrangeRed;
  leds[26] = CRGB::OrangeRed;
  leds[17] = CRGB::OrangeRed;
  leds[18] = CRGB::OrangeRed;
  leds[19] = CRGB::OrangeRed;
  leds[20] = CRGB::OrangeRed;
  leds[21] = CRGB::OrangeRed;
  leds[13] = CRGB::OrangeRed;
  leds[12] = CRGB::OrangeRed;
  leds[11] = CRGB::OrangeRed;
  leds[3] = CRGB::OrangeRed;

  leds[69] = CRGB::OrangeRed;
  leds[68] = CRGB::OrangeRed;
  leds[66] = CRGB::OrangeRed;
  leds[65] = CRGB::OrangeRed;
  leds[73] = CRGB::OrangeRed;
  leds[74] = CRGB::OrangeRed;
  leds[75] = CRGB::OrangeRed;
  leds[76] = CRGB::OrangeRed;
  leds[77] = CRGB::OrangeRed;
  leds[78] = CRGB::OrangeRed;
  leds[79] = CRGB::OrangeRed;
  leds[86] = CRGB::OrangeRed;
  leds[85] = CRGB::OrangeRed;
  leds[84] = CRGB::OrangeRed;
  leds[83] = CRGB::OrangeRed;
  leds[82] = CRGB::OrangeRed;
  leds[81] = CRGB::OrangeRed;
  leds[80] = CRGB::OrangeRed;
  leds[89] = CRGB::OrangeRed;
  leds[90] = CRGB::OrangeRed;
  leds[91] = CRGB::OrangeRed;
  leds[92] = CRGB::OrangeRed;
  leds[93] = CRGB::OrangeRed;
  leds[94] = CRGB::OrangeRed;
  leds[95] = CRGB::OrangeRed;
  leds[101] = CRGB::OrangeRed;
  leds[100] = CRGB::OrangeRed;
  leds[99] = CRGB::OrangeRed;
  leds[98] = CRGB::OrangeRed;
  leds[97] = CRGB::OrangeRed;
  leds[106] = CRGB::OrangeRed;
  leds[107] = CRGB::OrangeRed;
  leds[108] = CRGB::OrangeRed;
  leds[109] = CRGB::OrangeRed;
  leds[110] = CRGB::OrangeRed;
  leds[116] = CRGB::OrangeRed;
  leds[115] = CRGB::OrangeRed;
  leds[114] = CRGB::OrangeRed;
  leds[124] = CRGB::OrangeRed;
  FastLED.show();
}

void setLedsToBlink() {
    blankLeds();
  // RIGHT                               LEFT
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |      
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |    
  // 104|105|106|107|108|   |110|           | 17|   | 19| 20| 21| 22| 23 
  // 119|118|117|116|115|   |113|112      15| 14|   | 12| 11| 10| 9 | 8
  //    |121|122|123|124|125|126|127      0 | 1 | 2 | 3 | 4 | 5 | 6 |  

  leds[104] = CRGB::OrangeRed;
  leds[105] = CRGB::OrangeRed;
  leds[106] = CRGB::OrangeRed;
  leds[107] = CRGB::OrangeRed;
  leds[108] = CRGB::OrangeRed;
  leds[110] = CRGB::OrangeRed;
  leds[119] = CRGB::OrangeRed;
  leds[118] = CRGB::OrangeRed;
  leds[117] = CRGB::OrangeRed;
  leds[116] = CRGB::OrangeRed;
  leds[115] = CRGB::OrangeRed;
  leds[113] = CRGB::OrangeRed;
  leds[112] = CRGB::OrangeRed;
  leds[121] = CRGB::OrangeRed;
  leds[122] = CRGB::OrangeRed;
  leds[123] = CRGB::OrangeRed;
  leds[124] = CRGB::OrangeRed;
  leds[125] = CRGB::OrangeRed;
  leds[126] = CRGB::OrangeRed;
  leds[127] = CRGB::OrangeRed;

  leds[17] = CRGB::OrangeRed;
  leds[19] = CRGB::OrangeRed;
  leds[20] = CRGB::OrangeRed;
  leds[21] = CRGB::OrangeRed;
  leds[22] = CRGB::OrangeRed;
  leds[23] = CRGB::OrangeRed;
  leds[15] = CRGB::OrangeRed;
  leds[14] = CRGB::OrangeRed;
  leds[12] = CRGB::OrangeRed;
  leds[11] = CRGB::OrangeRed;
  leds[10] = CRGB::OrangeRed;
  leds[9] = CRGB::OrangeRed;
  leds[8] = CRGB::OrangeRed;
  leds[0] = CRGB::OrangeRed;
  leds[1] = CRGB::OrangeRed;
  leds[2] = CRGB::OrangeRed;
  leds[3] = CRGB::OrangeRed;
  leds[4] = CRGB::OrangeRed;
  leds[5] = CRGB::OrangeRed;
  leds[6] = CRGB::OrangeRed;
  FastLED.show();
  delay(50);
  blankLeds();

  // RIGHT                               LEFT
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |      
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |    
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |    
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |  
  //    |121|122|123|124|125|126|127      0 | 1 | 2 | 3 | 4 | 5 | 6 |  

  leds[121] = CRGB::OrangeRed;
  leds[122] = CRGB::OrangeRed;
  leds[123] = CRGB::OrangeRed;
  leds[124] = CRGB::OrangeRed;
  leds[125] = CRGB::OrangeRed;
  leds[126] = CRGB::OrangeRed;
  leds[127] = CRGB::OrangeRed;
  
  leds[0] = CRGB::OrangeRed;
  leds[1] = CRGB::OrangeRed;
  leds[2] = CRGB::OrangeRed;
  leds[3] = CRGB::OrangeRed;
  leds[4] = CRGB::OrangeRed;
  leds[5] = CRGB::OrangeRed;
  leds[6] = CRGB::OrangeRed;
  FastLED.show();
  delay(50);

  blankLeds();
  delay(100);

    // RIGHT                               LEFT
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |      
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |    
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |    
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |  
  //    |121|122|123|124|125|126|127      0 | 1 | 2 | 3 | 4 | 5 | 6 |  

  leds[121] = CRGB::OrangeRed;
  leds[122] = CRGB::OrangeRed;
  leds[123] = CRGB::OrangeRed;
  leds[124] = CRGB::OrangeRed;
  leds[125] = CRGB::OrangeRed;
  leds[126] = CRGB::OrangeRed;
  leds[127] = CRGB::OrangeRed;
  
  leds[0] = CRGB::OrangeRed;
  leds[1] = CRGB::OrangeRed;
  leds[2] = CRGB::OrangeRed;
  leds[3] = CRGB::OrangeRed;
  leds[4] = CRGB::OrangeRed;
  leds[5] = CRGB::OrangeRed;
  leds[6] = CRGB::OrangeRed;
  FastLED.show();
  delay(50);

    // RIGHT                               LEFT
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |      
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |   
  //    |   |   |   |   |   |   |           |   |   |   |   |   |   |    
  // 104|105|106|107|108|   |110|           | 17|   | 19| 20| 21| 22| 23 
  // 119|118|117|116|115|   |113|112      15| 14|   | 12| 11| 10| 9 | 8
  //    |121|122|123|124|125|126|127      0 | 1 | 2 | 3 | 4 | 5 | 6 |  

  leds[104] = CRGB::OrangeRed;
  leds[105] = CRGB::OrangeRed;
  leds[106] = CRGB::OrangeRed;
  leds[107] = CRGB::OrangeRed;
  leds[108] = CRGB::OrangeRed;
  leds[110] = CRGB::OrangeRed;
  leds[119] = CRGB::OrangeRed;
  leds[118] = CRGB::OrangeRed;
  leds[117] = CRGB::OrangeRed;
  leds[116] = CRGB::OrangeRed;
  leds[115] = CRGB::OrangeRed;
  leds[113] = CRGB::OrangeRed;
  leds[112] = CRGB::OrangeRed;
  leds[121] = CRGB::OrangeRed;
  leds[122] = CRGB::OrangeRed;
  leds[123] = CRGB::OrangeRed;
  leds[124] = CRGB::OrangeRed;
  leds[125] = CRGB::OrangeRed;
  leds[126] = CRGB::OrangeRed;
  leds[127] = CRGB::OrangeRed;

  leds[17] = CRGB::OrangeRed;
  leds[19] = CRGB::OrangeRed;
  leds[20] = CRGB::OrangeRed;
  leds[21] = CRGB::OrangeRed;
  leds[22] = CRGB::OrangeRed;
  leds[23] = CRGB::OrangeRed;
  leds[15] = CRGB::OrangeRed;
  leds[14] = CRGB::OrangeRed;
  leds[12] = CRGB::OrangeRed;
  leds[11] = CRGB::OrangeRed;
  leds[10] = CRGB::OrangeRed;
  leds[9] = CRGB::OrangeRed;
  leds[8] = CRGB::OrangeRed;
  leds[0] = CRGB::OrangeRed;
  leds[1] = CRGB::OrangeRed;
  leds[2] = CRGB::OrangeRed;
  leds[3] = CRGB::OrangeRed;
  leds[4] = CRGB::OrangeRed;
  leds[5] = CRGB::OrangeRed;
  leds[6] = CRGB::OrangeRed;
  FastLED.show();
  delay(50);
}

// Arduino Setup
void setup(void) {  
  // Open Serial 
  Serial.begin(115200);
  // change to Warning to improve the quality
  AudioLogger::instance().begin(Serial, AudioLogger::Warning); 

  // start I2S in
  Serial.println("starting I2S...");
  auto config = i2s.defaultConfig(RXTX_MODE);
  config.copyFrom(info); 
  config.i2s_format = I2S_STD_FORMAT;
  config.pin_ws = 14; // lrclk
  config.pin_bck = 15; // sck
  config.pin_data = 18; // dout
  config.pin_data_rx = 19; // din
  //config.fixed_mclk = sample_rate * 256;
  // config.pin_mck = 3; // must be 0,1 or 3 - only for ESP_IDF_VERSION_MAJOR >= 4
  i2s.begin(config);

  Serial.println("I2S started...");

  FastLED.addLeds<WS2812B, DATA_PIN, GRB>(leds, NUM_LEDS);  // GRB ordering is typical
  FastLED.setBrightness(20);
}

void loop() {
  copier.copy();

  int randomBlinkNumber = random(0, 1000);
  if (randomBlinkNumber == 1) {
    setLedsToBlink();
    setLedsToStandard();
  }
}
