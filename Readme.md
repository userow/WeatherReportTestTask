**Test task**

**Weather Application Overview :**

The goal of this project is to build a simple and lightweight weather mobile applications. The app contains 2 screens :

1. Home Screen - A tableview with search bar containing the weather for a list of main cities.
2. City weather - A tableview with the weather for the next 5 days for the selected city.


*API:*
Source : http://openweathermap.org/api 
Api Token : 
> **Note**: api key in a task was irrelevant. Created an account and created an API Key. Had to wait a while before it started working in requests without Error Code "cod":401

Relevant Api’s :
Current Weather data: https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
Call 5 day / 3 hour forecast data: https://api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}

> **Note**: api calls are irrelevant... if we're searching by given CityName - request should be GET https://api.openweathermap.org/data/2.5/weather?q={CityName/CityName,2LetterCountryShorthanded}&appid={API key} . If we're searching by given CityId - request should be GET https://api.openweathermap.org/data/2.5/weather?id={CityId}&appid={API key} . Temperature is given in Kelvin (Celsium + 273.15) unless &units=metric - Celsium or &units=imperial - Farenheit is added.

Images for different weather conditions: (see “How to get icon URL”) https://openweathermap.org/weather-conditions

**UI:**

In the multi city screen each cell should contain the following: 
1. Icon representing the weather
2. Name of the city
3. Description of the weather
4. Max and min temperatures

In the single city page :
1. Icon representing the weather
2. Day
3. Description of the weather 
4. Max and Min temperatures

**Bonus points :**
1. Caching - cache locally (in memory) the responses from the api and use them when applicable instead of making a new call to the api
2. Fahrenheit <-> Celsius - Add a button (right navbar button) to toggle between the different metrics
3. MapView - In the main screen add a button to each city cell that opens a map with a pin on the location of the city.
4. Any cool stuff you think you could add.  

**Guidelines :**
1. Swift should be used to write this. For UI either use Storyboards or SwiftUI
2. Open Source is Cool :) 

**Appendix :**
List of cities to show and their id’s : 
London : 2643743
TelAviv: 293396
NewYork: 5128581
Brussels: 2800866
Barcelona: 3128760
Paris: 2988507
Tokyo : 1850147
Beijing: 1816670
Sydney: 2147714
BuenosAires : 3432043
Miami: 4164138
Vancouver: 6173331
Moscow: 524901
Bangkok: 1609350
Johannesburg: 993800
Tunis: 2464470
Manila: 1701668

> **Info**: Thoughts on and limitation of MVP:   
> **Warning**: 1) I'm not sure if it will work without limitation of requests per minute - limited to 60 requests / 1 minute for free account.
> **Warning**: 2) I'm not sure what's the functionality of SEARCH field in multi city screen. I presume it could be wether Option-1 - search through a list of cties OR Option - 2 - search of a city not in a list with weather?q={CityName} request. Would implement Option-1.
> **Warning**: 3) Celsium / Farenheit - will implement if I would have spare time. There are two options of implementation - conversion and sending units=metric/imperial 
> **Warning**: 4) I'm usnure if MVVM is right for test task. Fast & dirty MVC or more familiar for me MVP probably had given me more efficiency. 
> **Warning**: 5) actually, It's a bad API example and example of bad REST contract, when you need to make lots of API calls in one screen (Multi Cities screen)
