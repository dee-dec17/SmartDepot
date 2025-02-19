//import 'dart:async';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'dart:async';



var geolocator = Geolocator();
var userLat=0.0, userLong=0.0;
var lat1 = 17.709634,lat2 = 17.697191,lat3 = 17.701352;
var long1 = 83.295812,long2 = 83.293951,long3 = 83.297625;
var index1 = 0,index2 = 0,index3 = 0;
var call = 0;

List<List<String>> userData = [
  ["RationCardNumber","ShopId"],
  ["WAP0384283D0137","0388243"],
  ["RAP038430668792","0388572"],
	["WAP020602400124","0388572"],
  ["JAP038828200284","0388572"]
];
//13056981
//JAP038828200284
//WAP0384283D0137
List<List<String>> shopData = [
  ["ShopId", "AgentId", "Status", "Longitude", "Latitude"],
  ["0388266", "13022613", "Available", "82.61113", "17.3290431"],
  ["0388267", "13022604", "Available", "82.61062", "17.3274187"],
  ["0388268", "13022610", "Available", "82.59153", "17.31888583"],
  ["0386051", "13730002", "Available", "83.44885", "17.89409653"],
  ["0386055", "13730025", "Available", "83.44457", "17.89529368"],
  ["0333067",	"13020348",	"Available", "83.33997", "17.92498594"],
  ["0333055",	"13020307",	"Available", "83.33977", "18.011745"],
  ["0318025",	"13021032", "Available", "83.33923",	"18.01081721"],
  ["0309033"	"13021191", "Available",	"83.33877",	"17.75312734"],
  ["0309032",	"13021190", "Available",	"83.33669",	"17.7544483"],
  ["0333052",	"13020306",	"Available", "83.33591",	"17.74532277"],
  ["0388243", "13056981", "Available", "83.29581", "17.709634"],
  ["0382025",	"13022127","Available",	"83.33439",	"17.72522822"],
  ["0333069",	"13020371",	"Available","83.33386",	"17.90841507"],
  ["0340044",	"13720031",	"Available","83.33314","17.7363422"],
  ["0333056","13020354",	"Available","83.33267","17.98826074"],
  ["0340038","13710094","Available","83.33263","17.72394608"],
  ["0309039","13021196","Available","83.33165","17.88721115"],
  ["0342028","13020437","Available","83.32958","17.7651334"],
  ["0386262","13022694","Available","83.32797","17.90390053"],
  ["0333068","13020365","Available","83.32782","17.90455598"],
  ["0327041","13720022","Available","83.32763","17.95049038"],
  ["0382029","13022130","Available","83.32692","17.72016993"],
  ["0319044","13021073","Available","83.32273","17.97934143"],
  ["0321011","13020459","Available","83.3215","17.97971548"],
  ["0309034","13021192","Available","83.32139","17.75735965"],
  ["0333058","13020589","Available","83.32133","17.74661466"],
  ["0334030","13020320","Available","83.32071","17.94032175"],
  ["0326034","13710137","Available","83.32038","18.01946675"],
  ["0326035","13020767","Available","83.32007","18.01905879"],
  ["0386359","13022499","Available","83.31995","17.95891777"],
  ["0327061","13021225","Available","83.31664","17.72874216"],
  ["0309036","13021193","Available","83.31651","17.74221679"],
  ["0336018","13020850","Available","83.31394","17.72658198"],
  ["0327056","13022044","Available","83.31143","17.73404849"],
  ["0334028","13020363","Available","83.30956","17.95824966"],
  ["0319011","13021054","Available","83.30948","17.70904067"],
  ["0327040","13710150","Available","83.30877","17.9584130"],
  ["0336036","13022110","Available","83.3076","17.9194268"],
  ["0318017","13021024","Available","83.30737","17.7324697"],
  ["0321050","13020493","Available","83.30594","17.97906469"],
  ["0337032","13020828","Available","83.30511","17.70388869"],
  ["0337024","13710139","Available","83.30459","17.70450671"],
  ["0337031","13020827","Available","83.30456","17.70280013"],
  ["0337027","13020823","Available","83.30383","17.70271051"],
  ["0337026","13020822","Available","83.30341","17.70345913"],
  ["0387006","13022539","Available","83.30208","17.88902319"],
  ["0381018","13022052","Available","83.30175","17.71941998"],
  ["0335025","13020355","Available","83.3016","17.72971774"],
  ["0316036","13021104","Available","83.3011","17.7069556"],
  ["0332022","13022015","Available","83.30104","17.73463858"],
  ["0317001","13022058","Available","83.30096","17.70741301"],
  ["0337036","13020831","Available","83.3006","17.70303805"],
  ["0341003","13022138","Available","83.30058","17.70955926"],
  ["0336007","13020839","Available","83.30051","17.70951534"],
  ["0337022","13020820","Available","83.30045","17.70794577"],
  ["0337034","13710077","Available","83.30038","17.70300209"],
  ["0337035","13020830","Available","83.30035","17.70280538"],
  ["0338013","13020956","Available","83.30006","17.71930475"],
  ["0337038","13020833","Available","83.29967","17.70198285"],
  ["0337037","13020832","Available","83.2993","17.70170173"],
  ["0334034","13021977","Available","83.29889","17.71600172"],
  ["0338001","13020876","Available","83.29827","17.69917981"],
  ["0387219","13022586","Available","83.29819","17.70103302"],
  ["0382004","13022113","Available","83.29807","17.71500545"],
  ["0327054","13022043","Available","83.29806","17.72987593"],
  ["0388575","13710188","Available","83.29805","17.72776505"],
  ["0382008","13022115","Available","83.29803","17.71772466"],
  ["0338002","13710289","Available","83.29803","17.70387123"],
  ["0318008","13021017","Available","83.2979","17.70660602"],
  ["0338011","13020884","Available","83.2977","17.71811664"],
  ["0333057","13020311","Available","83.2976","17.73205815"],
  ["0386112","13022504","Available","83.29751","17.7016105"],
  ["0341038","13022161","Available","83.29728","17.70564705"],
  ["0382009","13022116","Available","83.29724","17.71767572"],
  ["0342009","13020426","Available","83.29718","17.70690447"],
  ["0341036","13022159","Available","83.29716","17.70583093"],
  ["0341035","13022158","Available","83.2971","17.70555748"],
  ["0341039","13022162","Available","83.29693","17.70505686"],
  ["0382006","13022114","Available","83.29678","17.71609905"],
  ["0342005","13020423","Available","83.29675","17.70622471"],
  ["0338004","13020878","Available","83.29658","17.7045714"],
  ["0342003","13020531","Available","83.29648","17.70536097"],
  ["0342004","13020422","Available","83.29648","17.70532524"],
  ["0341037","13022160","Available","83.29648","17.70563934"],
  ["0388509","13022656","Available","83.29611","17.7145479"],
  ["0319016","13021058","Available","83.29609","17.70932945"],
  ["0388578","13710191","Available","83.29589","17.73372161"],
  ["0382022","13022124","Available","83.29509","17.71878409"],
  ["0336040","13710058","Available","83.29507","17.71599804"],
  ["0388572","13710186","Available","83.29498","17.70595448"],
  ["0388579","13710192","Available","83.29498","17.73283778"],
  ["0382021","13022123","Available","83.29494","17.73639933"],
  ["0388573","13710187","Available","83.29432","17.70682851"],
  ["0318007","13021016","Available","83.29425","17.71227794"],
  ["0320041","13021160","Available","83.29417","17.99575703"],
  ["0336025","13720027","Available","83.29412","17.89184151"],
  ["0322040","13021207","Available","83.29404","17.72876596"],
  ["0342025","13020436","Available","83.29387","17.86587651"],
  ["0336039","13020866","Available","83.29353","17.71860409"],
  ["0334001","13010391","Available","83.29334","17.96719234"],
  ["0334002","13010386","Available","83.29287","17.96610303"],
  ["0334003","13010393","Available","83.29287","17.9661083"],
  ["0320047","13021162","Available","83.29283","17.98621752"],
  ["0342038","13020445","Available","83.29266","17.73384429"],
  ["0336037","13020864","Available","83.29196","17.71770975"],
  ["0327057","13022045","Available","83.29109","17.7321531"],
  ["0310139","13021248","Available","83.28945","17.73228715"]
];
void printing(){
  print(shopData[0]);
}

void findNearbyShops() async{
  var max = 1000000000.0;
  for (int i = 1; i < shopData.length; i++){
    var long = double.parse(shopData[i][3]);
    var lat = double.parse(shopData[i][4]);
    double distanceInMeters = await Geolocator().distanceBetween(userLong, userLat, long, lat);
    distanceInMeters = double.parse((distanceInMeters/100).toStringAsFixed(12));
    print("Distance = $distanceInMeters, Max = $max");
    if (i!= index1 && distanceInMeters < max){
      max = distanceInMeters;
      print("Changeing");
      // lat3 = lat2;
      // long3 = long2;
      index3 = index2;
      // lat2 = lat;
      // long2 = long;
      index2 = i;
      print("index2 : $index2, Lat1 = $lat2, long2 = $long2");
      print("index3 : $index3, Lat1 = $lat3, long2 = $long3");
    }
  }
  }

getUserLocation() async{
var locationOptions = LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);
var positionStream = geolocator.getPositionStream(locationOptions).listen(
    (Position position) {
      userLat = position.latitude;
      userLong = position.longitude;
      print("$userLat , $userLong");
    });
    print(positionStream);
  }



int validateDealer(String inId){
  for(int i = 1; i < shopData.length; i++){
    if(shopData[i][1] == inId){
      return i;
    }
  }
  return 0;
}

void updateShopStatus (int id, bool status){
  if(status){
    shopData[id][2] = "Available";
  }
  else{
    shopData[id][2] = "Busy";
  }
}


int shopLoc(String shopId){
  for(int i = 1; i < shopData.length; i++){
    if(shopId == shopData[i][0]){
      print(shopData[i][0]);
      print("Shop Found");
      print("Shop Found");
      index1 = i;
      print("index1 = $index1");
      return i;
    }
  }
  print("ONce this part of code");
  return 0;
}

int alotedShop(String rcNumber){
  for (int i = 1; i < userData.length; i++){
    print(rcNumber);
    if (rcNumber == userData[i][0]){
      print(userData[i][0]);
      print("User Found");
      print("User Found");
      var r = shopLoc(userData[i][1]);
      print("Return value = $r");
      return(r);
    }
  }
  return 0;
}
