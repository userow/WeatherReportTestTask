//
//  CityWeatherTableViewCell.swift
//  WeatherReport
//
//  Created by Pavlo Vasylenko on 25.06.2022.
//

import UIKit
import Kingfisher

class CityWeatherTVC: UITableViewCell {
  
  static let identifier = "CityWeatherTVC"

  @IBOutlet weak var cityNameLabel: UILabel!
  @IBOutlet weak var weatherDescriptionLabel: UILabel!
  @IBOutlet weak var weatherImageView: UIImageView!
  @IBOutlet weak var lowLabel: UILabel!
  @IBOutlet weak var highLabel: UILabel!
  @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  override func prepareForReuse() {
    cityNameLabel.text = ""
    weatherDescriptionLabel.text = ""
    weatherDescriptionLabel.isHidden = true
    weatherImageView.kf.cancelDownloadTask()
    weatherImageView.image = nil
    weatherImageView.isHidden = true
    lowLabel.text = ""
    lowLabel.isHidden = true
    highLabel.text = ""
    highLabel.isHidden = true
    activityIndicatorView.isHidden = true
  }
  
  func updateData(with cityWeather: CityWeather) {
    tag = cityWeather.id
    cityNameLabel.text = cityWeather.name
    weatherDescriptionLabel.text = cityWeather.weatherDetail
    lowLabel.text = cityWeather.minTemp
    highLabel.text = cityWeather.maxTemp
    
    //TODO: add weather image through KingFisher
    if let icon = cityWeather.weatherImageIcon,
       let url = URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png") {
      //TODO: - move constant string somewhere, @2x to screen.scale of Device - either @2x or @3x AHA! there is no @3x
      weatherImageView.kf.setImage(with: url)
      
    }
    weatherImageView.isHidden = cityWeather.notFullyLoaded
    weatherDescriptionLabel.isHidden = cityWeather.notFullyLoaded
    lowLabel.isHidden = cityWeather.notFullyLoaded
    highLabel.isHidden = cityWeather.notFullyLoaded
    
    activityIndicatorView.isHidden = !cityWeather.notFullyLoaded
    if cityWeather.notFullyLoaded { activityIndicatorView.startAnimating() }
  }
}
