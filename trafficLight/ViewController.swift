//
//  ViewController.swift
//  trafficLight
//
//  Created by Андрей on 08.02.2024.
//
import UIKit

enum TrafficLightColor {
    case red
    case yellow
    case green
    case gray
}

class ViewController: UIViewController {
    
    lazy var redView: UIView = {
        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .gray
        redView.layer.cornerRadius = 110
        return redView
    }()
    
    lazy var yellowView: UIView = {
        let yellowView = UIView()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.backgroundColor = .gray
        yellowView.layer.cornerRadius = 110
        return yellowView
    }()
    
    lazy var greenView: UIView = {
        let greenView = UIView()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .gray
        greenView.layer.cornerRadius = 110
        return greenView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var switchButton : UIButton = {
        let switchButton = UIButton(type: .system)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.setTitle("начало", for: .normal)
        switchButton.setTitleColor(.white, for: .normal)
        switchButton.layer.cornerRadius = 15
        switchButton.addTarget(self, action: #selector(switchLight), for: .touchUpInside)
        switchButton.backgroundColor = .black
        return switchButton
    }()
    
    var currentColor: TrafficLightColor = .gray
    
     func updateLight() {
        redView.backgroundColor = (currentColor == .red) ? .red : .gray
        yellowView.backgroundColor = (currentColor == .yellow) ? .yellow : .gray
        greenView.backgroundColor = (currentColor == .green) ? .green : .gray
    }
    
    @objc func switchLight() {
        switch currentColor {
        case .red:
            currentColor = .green
        case .yellow:
            currentColor = .red
        case .green:
            currentColor = .yellow
        case .gray:
            currentColor = .red
        }
        updateLight()
        switchButton.setTitle("далее", for: .normal)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        view.addSubview(switchButton)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 60),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -60),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -16),
            
            switchButton.leadingAnchor.constraint(equalTo: stackView.layoutMarginsGuide.trailingAnchor,constant: -10),
            switchButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            switchButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -16),
        ])
    }
}


