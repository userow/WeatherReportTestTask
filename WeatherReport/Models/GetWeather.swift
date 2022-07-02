//
//  Weather.swift
//  WeatherReport
//
//  Created by Pavlo Vasylenko on 25.06.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getWeather = try? newJSONDecoder().decode(GetWeather.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.getWeatherTask(with: url) { getWeather, response, error in
//     if let getWeather = getWeather {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - GetWeather
struct GetWeather: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: GetWeatherSys
    let timezone, id: Int
    let name: String
    let cod: Int
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
struct Clouds: Codable {
    let all: Int
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
struct Coord: Codable {
    let lon, lat: Double
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.mainTask(with: url) { main, response, error in
//     if let main = main {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
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
struct GetWeatherSys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
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
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

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
// in GetForecast
