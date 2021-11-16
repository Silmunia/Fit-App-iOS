//
//  ActivityViewController.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 15/11/21.
//

import UIKit

class ActivityViewController: UIViewController {
    
    var distanceValue: Float = 0
    var calorieCounter: Int = 0
    var timeCounter: [Int] = [0, 0, 0]
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .darkGray
        label.text = "CORRIDA"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 88, weight: .bold)
        label.textColor = .darkGray
        label.text = String(format: "%.1f km", distanceValue)
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var calorieImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "flame.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .systemBlue
        self.view.addSubview(view)
        return view
    }()
    
    lazy var calorieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .darkGray
        label.text = "\(calorieCounter) kCal"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var timeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "clock.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .systemBlue
        self.view.addSubview(view)
        return view
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .darkGray
        label.text = String(format: "%02d:%02d:%02d", timeCounter[0], timeCounter[1], timeCounter[2])
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var heartImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "heart.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .systemBlue
        self.view.addSubview(view)
        return view
    }()
    
    lazy var heartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .darkGray
        label.text = "- BPM"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.font.lineHeight),
            
            distanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 90),
            distanceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            distanceLabel.heightAnchor.constraint(equalToConstant: distanceLabel.font.lineHeight),
            
            calorieImage.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 50),
            calorieImage.widthAnchor.constraint(equalToConstant: 40),
            calorieImage.heightAnchor.constraint(equalTo: calorieImage.widthAnchor),
            calorieImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            calorieLabel.topAnchor.constraint(equalTo: calorieImage.bottomAnchor, constant: 10),
            calorieLabel.heightAnchor.constraint(equalToConstant: calorieLabel.font.lineHeight),
            calorieLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            calorieLabel.centerXAnchor.constraint(equalTo: calorieImage.centerXAnchor),
            
            timeImage.topAnchor.constraint(equalTo: calorieImage.topAnchor),
            timeImage.widthAnchor.constraint(equalTo: calorieImage.widthAnchor),
            timeImage.heightAnchor.constraint(equalTo: calorieImage.heightAnchor),
            timeImage.centerXAnchor.constraint(equalTo: calorieImage.centerXAnchor, constant: -self.view.bounds.width/3.2),
            
            timeLabel.topAnchor.constraint(equalTo: calorieLabel.topAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: timeLabel.font.lineHeight),
            timeLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            timeLabel.centerXAnchor.constraint(equalTo: timeImage.centerXAnchor),
            
            heartImage.topAnchor.constraint(equalTo: calorieImage.topAnchor),
            heartImage.widthAnchor.constraint(equalTo: calorieImage.widthAnchor),
            heartImage.heightAnchor.constraint(equalTo: calorieImage.heightAnchor),
            heartImage.centerXAnchor.constraint(equalTo: calorieImage.centerXAnchor, constant: self.view.bounds.width/3.2),
            
            heartLabel.topAnchor.constraint(equalTo: calorieLabel.topAnchor),
            heartLabel.heightAnchor.constraint(equalToConstant: heartLabel.font.lineHeight),
            heartLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            heartLabel.centerXAnchor.constraint(equalTo: heartImage.centerXAnchor),
            
        ])
    }

}
