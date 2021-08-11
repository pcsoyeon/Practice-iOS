//
//  WeatherVC.swift
//  Weather
//
//  Created by soyeon on 2021/08/11.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var weatherTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Local Variables
    
    private var models = [DailyWeatherEntry]()
    private var currentWeather: CurrentWeather?
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setTableView()
    }
}

extension WeatherVC {
    func configUI() {
        view.addSubview(weatherTableView)
        
        weatherTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setTableView() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        weatherTableView.register(WeatherTVC.self, forCellReuseIdentifier: WeatherTVC.identifier)
        
        weatherTableView.separatorStyle = .none
    }
    
    func setLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else { return }
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        let url = "https://api.darksky.net/forecast/ddcc4ebb2a7c9930b90d9e59bda0ba7a/\(lat),\(long)?exclude=[flags,minutely]"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, url, error in
            // Validation
            guard let data = data, error == nil else {
                print("무언가 잘못 옴 .. 서버 잘못 .. ?")
                return
            }
            
            // Convert data to models / some object
            var json: WeatherDataResponse?
            do {
                json = try JSONDecoder().decode(WeatherDataResponse.self, from: data)
            }
            catch {
                print("error: \(error)")
            }
            
            guard let result = json else { return }
            let entries = result.daily.data
            self.models.append(contentsOf: entries)
            
            let current = result.currently
            self.currentWeather = current
            
            // Update user interface
            DispatchQueue.main.async {
                self.weatherTableView.reloadData()
                self.weatherTableView.tableHeaderView = self.createTableViewHeader()
            }
            
        }).resume()
    }
    
    func createTableViewHeader() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width))
        
        let locationLabel = UILabel(frame: CGRect(x: 10, y: 10, width: headerView.frame.width - 20, height: headerView.frame.height/5))
        let summaryLabel = UILabel(frame: CGRect(x: 10, y: locationLabel.frame.height+20, width: headerView.frame.size.width - 20, height: headerView.frame.size.height/5))
        let tempLabel = UILabel(frame: CGRect(x: 10, y: locationLabel.frame.height+20+summaryLabel.frame.height, width: headerView.frame.size.width - 20, height: headerView.frame.size.height/2))
        
        headerView.addSubviews([locationLabel, summaryLabel, tempLabel])
        
        locationLabel.textAlignment = .center
        summaryLabel.textAlignment = .center
        tempLabel.textAlignment = .center
        
        guard let currentWeather = currentWeather else { return UIView() }
        locationLabel.text = "위치"
        summaryLabel.text = currentWeather.summary
        tempLabel.text = "\(currentWeather.temperature)"
        
        return headerView
    }
}

// MARK: - UITableView Delegate

extension WeatherVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - UITableView DataSource

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTVC.identifier) as? WeatherTVC else {
            return UITableViewCell()
        }
        cell.initCell(with: models[indexPath.row])
        return cell
    }
}

extension WeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
}
