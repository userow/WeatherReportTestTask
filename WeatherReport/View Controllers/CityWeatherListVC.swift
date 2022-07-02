//
//  CityWeatherListVC.swift
//  WeatherReport
//
//  Created by Pavlo Vasylenko on 24.06.2022.
//

import UIKit
import Combine

class CityWeatherListVC: UIViewController {
  
  private var citiesViewModel: CitiesViewModel!
  
  @IBOutlet weak var tableView: UITableView!
  
  private var cancellables: Set<AnyCancellable> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTableView()
    bindViewModel()
  }
  
  /// Register the cell for reuse and add any configurations for the tableView
  private func setUpTableView() {
//    tableView.register(CityWeatherTableViewCell.self, forCellReuseIdentifier: CityWeatherTableViewCell.identifier)
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  /// Use the viewModel to fetch the data and publish the event
  private func bindViewModel() {
    self.citiesViewModel = CitiesViewModel()
    
    citiesViewModel.$cityWeatherList
      .receive(on: DispatchQueue.main)
      .sink { [weak self] cities in
        //TODO: check per-row renewal
        self?.tableView.reloadData()
      }
      .store(in: &cancellables)
  }
}

extension CityWeatherListVC: UITableViewDataSource {
  //MARK: - UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    citiesViewModel.cityWeatherList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherTVC.identifier, for: indexPath) as! CityWeatherTVC
    cell.updateData(with: self.citiesViewModel.cityWeatherList[indexPath.row])
    return cell
  }
}

extension CityWeatherListVC: UITableViewDelegate {
  // MARK: - UITableViewDelegate
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let id = citiesViewModel.selectedItemId(indexPath: indexPath) {
      //TODO: call VC with forecast and put into nav stack
    }
  }
}

