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
    
    private lazy var titleLabel: UILabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 62, weight: .medium)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.sizeToFit()
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layout()
        setupViews()
        setupNavigationBar()
        setupLabels()
        
    }
    
    private func addSubviews() {
        [titleLabel].forEach({ view.addSubview($0)})
    }
    
    // MARK: Setup Views
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .search)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
    }
    
    private func setupLabels() {
        titleLabel.text = DateHelper.shared.currentDateString()
    }
    
    // MARK: Actions
    
    private func searchAction() {
        print("tap tap")
    }
    
    // MARK: Layout
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
        }
    }
}
