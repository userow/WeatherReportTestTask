//
//  CitiesViewModel.swift
//  WeatherReport
//
//  Created by Pavlo Vasylenko on 25.06.2022.
//

import Foundation

import Combine

struct CityWeather {
  let id: Int
  let name: String
  var overrideFullyLoaded: Bool = false
  var notFullyLoaded: Bool {
    get {
      return overrideFullyLoaded || weatherDetail == nil || weatherImageIcon == nil || maxTemp == nil || minTemp == nil
    }
  }
  let weatherDetail: String?
  let weatherImageIcon: String?
  let maxTemp: String?
  let minTemp: String?
}


class CitiesViewModel: NSObject {
  
  private var apiService: APIService!
  
  private(set) var citiesList : [CityBrief] = []
  
  @Published private(set) var cityWeatherList: [CityWeather] = []
    
  override init() {
    super.init()
    self.apiService = APIService()
    getCitiesList()
  }
  
  //MARK: - public interface
  func getCitiesList() {
    self.apiService.getCities(completion: { cities in
      self.citiesList = cities
      self.processCities()
    })
  }
  
  
  func selectedItemId(indexPath: IndexPath) -> Int?{
    var result: Int? = nil
    if indexPath.row >= 0 && indexPath.row < cityWeatherList.count {
      result = citiesList[indexPath.row].id
    }
    return result
  }
  
  //MARK: - private - processing
  private func processCities() {
    var result: [CityWeather] = [CityWeather]()
    for city in self.citiesList {
      result.append(CityWeather(id: city.id, name: city.name, weatherDetail: nil, weatherImageIcon: nil, maxTemp: nil, minTemp: nil))
    }
    
    self.cityWeatherList = result
    
    
    //execute api - refactor if there would be issues
    for i in 0...(self.cityWeatherList.count - 1) {
      let city = self.cityWeatherList[i]
      
      apiService.getWeather(id: city.id) { getWeather, error in
        if let getWeather = getWeather, let weather = getWeather.weather.first {
          let cityWeather = CityWeather(id: city.id,
                                        name: getWeather.name,
                                        weatherDetail: weather.weatherDescription,
                                        weatherImageIcon: weather.icon,
                                        maxTemp: "\(getWeather.main.tempMax) ºC",
                                        minTemp: "\(getWeather.main.tempMin) ºC")
          
          self.cityWeatherList[i] = cityWeather
        }
      }
    }
  }
}
