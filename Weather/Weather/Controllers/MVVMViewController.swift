//
//  MVVMViewController.swift
//  Weather
//
//  Created by soyeon on 2021/08/09.
//

import UIKit
import Moya

class MVVMViewController: UIViewController {
    
    // MARK: - Properties
    
    private var weatherVM: WeatherViewModel!
    private let weatherView = WeatherView()
    private let authProvider = MoyaProvider<WeatherService>()
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getWeather()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(weatherView)
        weatherView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Network
    
    func getWeather() {
        let param: WeatherRequest = WeatherRequest.init(35.7796, -78.6382, KeyCenter.key)
        
        authProvider.request(.current(param: param)) { response in
            switch response {
            case .success(let result):
                do {
                    let data = try result.map(WeatherModel.self)
                    dump(data)
                    self.weatherVM = WeatherViewModel(data)
                    self.weatherVM.configUI(self.weatherView)
                    
//                    DispatchQueue.main.async {
//                        self.weatherVM.configUI(self.weatherView)
//                    }
                    
                } catch(let err) {
                    print("디코드 안됨 - ", err.localizedDescription)
                }
            case .failure(let err):
                print("데이터 못 받음 - ",err.localizedDescription)
            }
        }
    }
}
