//
//  Cities.swift
//  WeatherReport
//
//  Created by Pavlo Vasylenko on 25.06.2022.
//

import Foundation

struct CityBrief: Hashable {
  let id: Int
  let name: String
  
  func hash(into hasher: inout Hasher) {
      hasher.combine(id)
  }
}

