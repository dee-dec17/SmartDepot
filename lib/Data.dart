import 'dart:math';
List<List<String>> userData = [
  ["RationCardNumber","ShopId"],
  ["","0388266"],
];

List<List<String>> shopData = [
  ["ShopId", "AgentId", "Status", "Longitude", "Latitude"],
  ["0388266", "13022613", "Not Busy", "82.61113", "17.32904318"],
  ["0388267", "13022604", "Not Busy", "82.61062", "17.3274187"],
  ["0388268", "13022610", "Not Busy", "82.59153", "17.31888583"],
  ["0386051", "13730002", "Not Busy", "83.44885", "17.89409653"],
  ["0386055", "13730025", "Not Busy", "83.44457", "17.89529368"],
];
void printing(){
  print(shopData[0]);
}
int shopLoc(String shopId){
  
}

int alotedShop(String rcNumber){
  for (int i = 1; i < userData.length; i++){
    if (rcNumber == userData[i][0]){
      return(shopLoc(userData[i][1]));
    }
  }
  return 0;
}