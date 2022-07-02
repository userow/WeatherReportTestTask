//
//  APIService.swift
//  WeatherReport
//
//  Created by Pavlo Vasylenko on 25.06.2022.
//

import Foundation
import UIKit

class APIService :  NSObject {
  
  
  private let baseUrl = URL(string: "http://api.openweathermap.org/data/2.5/")!
  private let weatherPath = "weather"
  private let forecastPath = "forecast"
  private let apiKey = "526bd581142e3e404521e055f95a49ff"
  
  //for case if there will be some async Cities retrival
  func getCities(completion: @escaping ([CityBrief]) -> ()) {
    let cities: [CityBrief] = [
      CityBrief(id: 2643743, name: "London"),
      CityBrief(id: 293396, name: "TelAviv"),
      CityBrief(id: 5128581, name: "NewYork"),
      CityBrief(id: 2800866, name: "Brussels"),
      CityBrief(id: 3128760, name: "Barcelona"),
      CityBrief(id: 2988507, name: "Paris"),
      CityBrief(id: 1850147, name: "Tokyo"),
      CityBrief(id: 1816670, name: "Beijing"),
      CityBrief(id: 2147714, name: "Sydney"),
      CityBrief(id: 3432043, name: "BuenosAires"),
      CityBrief(id: 4164138, name: "Miami"),
      CityBrief(id: 6173331, name: "Vancouver"),
      CityBrief(id: 524901, name: "Moscow"),
      CityBrief(id: 1609350, name: "Bangkok"),
      CityBrief(id: 993800, name: "Johannesburg"),
      CityBrief(id: 2464470, name: "Tunis"),
      CityBrief(id: 1701668, name: "Manila"),
    ]
    
    completion(cities)
  }
  
  func getWeather(id: Int, unit: String = "metric", completion: @escaping (GetWeather?, Error?) -> ()) {
    var url = URL(string: weatherPath, relativeTo: baseUrl)!.absoluteURL
    var urlComponents = URLComponents(string: url.absoluteString)!
    urlComponents.queryItems = [
      URLQueryItem(name: "id", value: "\(id)"),
      URLQueryItem(name: "units", value: unit),
      URLQueryItem(name: "appid", value: apiKey),
    ]
    
    urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
    url = urlComponents.url!
    
    let task = URLSession.shared.weatherTask(with: url) { weather, response, error in
      guard
        let weather = weather,                        // is there data
        let response = response as? HTTPURLResponse,  // is there HTTP response
        200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
        error == nil                                  // was there no error
      else {
        completion(nil, error)
        return
      }
      
      completion(weather, nil)
    }
    task.resume()
  }
}

// MARK: - Helper functions for creating encoders and decoders
func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers
extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func weatherTask(with url: URL, completionHandler: @escaping (GetWeather?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
