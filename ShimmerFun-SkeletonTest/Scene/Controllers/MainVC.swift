//
//  MainVC.swift
//  ShimmerFun-SkeletonTest
//
//  Created by Emre Koçak on 21.02.2023.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - UI Elements
    
    lazy var titleLabel: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shimmer"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60)
//        label.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        
        return label
    }()
    
    lazy var showButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Show Skeleton", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let titleLayer = CAGradientLayer()
    private var isShowSkeleton: Bool = false
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(showButton)
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        titleLayer.frame = titleLabel.bounds
        titleLayer.cornerRadius = titleLabel.bounds.height / 2
    }
    
    // MARK: - Funcs
    
    func setupUI() {
        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            showButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            showButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            showButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
    
    func skeletonSetup() {
     
        titleLayer.startPoint = CGPoint(x: 0, y: 0.5)
        titleLayer.endPoint = CGPoint(x: 1, y: 0.5)
        titleLabel.layer.addSublayer(titleLayer)

        let titleGroup = makeAnimationGroup()
        titleGroup.beginTime = 0.0
        titleLayer.add(titleGroup, forKey: "backgroundColor")
    
    }
}

// MARK: - Actions
@objc
extension MainVC {
    func buttonTapped() {
        isShowSkeleton = !isShowSkeleton
        print("Butona tıklandı.")
        titleLabel.text = "Shimmer"
        if isShowSkeleton {
            skeletonSetup()
            titleLabel.text = ""
        }
    }
}

// MARK: - Skeleton Protocol
/// inherit
extension MainVC: SkeletonLoadable {}
