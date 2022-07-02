//
//  Forecast.swift
//  WeatherReport
//
//  Created by Pavlo Vasylenko on 25.06.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getForecast = try? newJSONDecoder().decode(GetForecast.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.getForecastTask(with: url) { getForecast, response, error in
//     if let getForecast = getForecast {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - GetForecast
struct GetForecast: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.cityTask(with: url) { city, response, error in
//     if let city = city {
//       ...
//     }
//   }
//   task.resume()

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.coordTask(with: url) { coord, response, error in
//     if let coord = coord {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Coord
// in GetWeather

//
// To read values from URLs:
//
//   let task = URLSession.shared.listTask(with: url) { list, response, error in
//     if let list = list {
//       ...
//     }
//   }
//   task.resume()

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.cloudsTask(with: url) { clouds, response, error in
//     if let clouds = clouds {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Clouds
//  in GetWeather

//
// To read values from URLs:
//
//   let task = URLSession.shared.mainClassTask(with: url) { mainClass, response, error in
//     if let mainClass = mainClass {
//       ...
//     }
//   }
//   task.resume()

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.rainTask(with: url) { rain, response, error in
//     if let rain = rain {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.sysTask(with: url) { sys, response, error in
//     if let sys = sys {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.weatherTask(with: url) { weather, response, error in
//     if let weather = weather {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Weather
// in GetWeather

//
// To read values from URLs:
//
//   let task = URLSession.shared.windTask(with: url) { wind, response, error in
//     if let wind = wind {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}
