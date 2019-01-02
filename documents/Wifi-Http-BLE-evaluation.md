# WiFi-Http-BLE Evaluation

## WiFi Evaluation

In order to evaluate the WiFi packages following things have been considered:

- Getting all the available list of WiFi connections.
- Connecting to a specific WiFi connection using the SSID and Password.
- Checking the available network whether connected or not, if connected to which network mobile or Wifi.

### Evaluation Status (WiFi Evaluation)

- [WiFi](https://pub.dartlang.org/packages/wifi) and [Connectivity](https://pub.dartlang.org/packages/connectivity) packages are evaluated. WiFi package is responsible fo getting the list of all available WiFi connections and connecting a specific one using the SSID and password
- Connectivity package is used to check the status of connection, whether app is connected to any internet or not. If yes to which one WiFi or mobile.

  ![Image](https://raw.githubusercontent.com/amittkSharma/flutter_app/develop/documents/images/app_wifi_connections_list_sample.jpg)

## Http Evaluation

- The basic idea behind evaluation is to access the third party REST API. And also test the availaility of internet with in the app.

### Evaluation Status (Http Evaluation)

- This evaluation basically consist of making an HTTP request to a REST API, for this purpose [HTTP](https://pub.dartlang.org/packages/http) package is being used. Mock data is being requested from internet to display as a list. This feature also tests the availability of internet with in the app. The data will only be displayed is there a internet connection.

  ![Image](https://raw.githubusercontent.com/amittkSharma/flutter_app/develop/documents/images/app_http_rest_api_sample.jpg)

## BLE Evaluation

- BLE evaluation is basically testing the bluetooth capabilities with in the app.

### Evaluation Status (BLE Evaluation)

- The DART package is broken, the DART team is working on it and releasing it soon. As basic typings are missing. Keeping an constant eye on this and also looking for altenative to work with.
- TODO: Evaluation pending.
