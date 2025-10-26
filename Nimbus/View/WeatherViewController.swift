//
//  ViewController.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    // MARK: UI
    
    private lazy var imageView: UIImageView = UIImageView().apply {
        $0.contentMode = .scaleAspectFill
    }
    
    private lazy var titleLabel: UILabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = DateHelper.shared.currentDateString()
        $0.sizeToFit()
    }
    
    private lazy var temperatureLabel: UILabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 186, weight: .bold)
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private lazy var degreeLabel: UILabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textAlignment = .center
        $0.text = Constants.Weather.degreeSymbol
        $0.sizeToFit()
    }
    
    private lazy var cityLabel: UILabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 32, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "Yekaterinburg"
        $0.sizeToFit()
    }
    
    private lazy var weatherContentView: UIView = UIView().apply {
        $0.backgroundColor = .white
        $0.alpha = 0.5
        $0.roundedView(corners: [.layerMaxXMaxYCorner,
                                 .layerMinXMaxYCorner,
                                 .layerMinXMinYCorner,
                                 .layerMaxXMinYCorner])
    }
    
    private var weatherViewModel: WeatherViewModel!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layout()
        setupViews()
        setupNavigationBar()
        viewUpdate()
    }
    
    private func addSubviews() {
        [imageView,
         titleLabel,
         temperatureLabel,
         degreeLabel,
         cityLabel,
         weatherContentView].forEach({ view.addSubview($0)})
    }
    
    // MARK: Setup Views
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(searchAction))
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        imageView.image = UIImage(named: "rain")
    }
    
    private func viewUpdate() {
        self.weatherViewModel = WeatherViewModel()
        self.weatherViewModel.bindViewModelToController = {
            guard let weatherData = self.weatherViewModel.weatherData else { return }
            self.setupLabel(temp: weatherData.fact.temp)
        }
    }
    
    private func setupLabel(temp: Int) {
        temperatureLabel.text = "\(temp)"
    }
    
    // MARK: Actions
    
    @objc private func searchAction() {
        print("tap tap")
    }
    
    // MARK: Layout
    
    private func layout() {
        imageView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(11)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        degreeLabel.snp.makeConstraints {
            $0.centerY.equalTo(temperatureLabel).offset(-42)
            $0.left.equalTo(temperatureLabel.snp.right).offset(5)
            $0.right.lessThanOrEqualToSuperview().inset(20)
        }
        
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(86)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().inset(40)
        }
        
        weatherContentView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.height.equalTo(200)
        }
    }
}
