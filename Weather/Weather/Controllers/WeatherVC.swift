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
            print(result.currently.summary)
            
            // Update user interface
            
        }).resume()
    }
}

// MARK: - UITableView Delegate

extension WeatherVC: UITableViewDelegate {
    
}

// MARK: - UITableView DataSource

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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
