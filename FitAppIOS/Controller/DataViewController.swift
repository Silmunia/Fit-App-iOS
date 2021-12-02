//
//  DataViewController.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 15/11/21.
//

import UIKit

class DataViewController: UIViewController {
    
    let valueTextSize: CGFloat = 42
    let titleTextSize: CGFloat = 26
    
    lazy var dataImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let dataImage = UIImage(named: "HistoryScreenData")
        view.image = dataImage
        self.view.addSubview(view)
        return view
    }()
    
    lazy var horizontalSeparator: UIImageView = {
        let view = UIImageView()
        let viewColor = UIImage.imageWithColor(color: .gray)
        view.image = viewColor
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        return view
    }()
    
    lazy var verticalSeparator: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let viewColor = UIImage.imageWithColor(color: .gray)
        view.image = viewColor
        self.view.addSubview(view)
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 38, weight: .bold)
        label.textColor = .white
        label.text = "15/10"
        label.accessibilityLabel = "15 de Outubro"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var stepsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: titleTextSize, weight: .regular)
        label.textColor = .darkGray
        label.text = "Passos"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var stepsValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: valueTextSize, weight: .bold)
        label.textColor = .darkGray
        label.text = "3789"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var durationTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: titleTextSize, weight: .regular)
        label.textColor = .darkGray
        label.text = "Duração"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var durationValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: valueTextSize, weight: .bold)
        label.textColor = .darkGray
        label.text = "32:15"
        label.accessibilityLabel = "32 minutos e 15 segundos"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var distanceTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: titleTextSize, weight: .regular)
        label.textColor = .darkGray
        label.text = "Distância"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var distanceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: valueTextSize, weight: .bold)
        label.textColor = .darkGray
        label.text = "13.14 km"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var caloryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: titleTextSize, weight: .regular)
        label.textColor = .darkGray
        label.text = "Calorias"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var caloryValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: valueTextSize, weight: .bold)
        label.textColor = .darkGray
        label.text = "273 kCal"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        configureLayout()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            dataImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            dataImage.bottomAnchor.constraint(equalTo: dataImage.topAnchor, constant: 315),
            dataImage.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            dataImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: dataImage.topAnchor, constant: 5),
            dateLabel.centerXAnchor.constraint(equalTo: dataImage.centerXAnchor),
            
            horizontalSeparator.topAnchor.constraint(equalTo: dataImage.bottomAnchor),
            horizontalSeparator.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            horizontalSeparator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            horizontalSeparator.widthAnchor.constraint(equalToConstant: 1),
            
            verticalSeparator.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            verticalSeparator.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            verticalSeparator.heightAnchor.constraint(equalToConstant: 1),
            verticalSeparator.centerYAnchor.constraint(equalTo: horizontalSeparator.centerYAnchor),
            
            stepsValue.topAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: 55),
            stepsValue.heightAnchor.constraint(equalToConstant: stepsValue.font.lineHeight),
            stepsValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -self.view.bounds.width/4),
            
            stepsTitle.topAnchor.constraint(equalTo: stepsValue.bottomAnchor, constant: 2.5),
            stepsTitle.heightAnchor.constraint(equalToConstant: stepsTitle.font.lineHeight),
            stepsTitle.leadingAnchor.constraint(equalTo: stepsValue.leadingAnchor),
            stepsTitle.trailingAnchor.constraint(equalTo: stepsValue.trailingAnchor),
            
            durationValue.topAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: 55),
            durationValue.heightAnchor.constraint(equalToConstant: durationValue.font.lineHeight),
            durationValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.bounds.width/4),
            
            durationTitle.topAnchor.constraint(equalTo: durationValue.bottomAnchor, constant: 2.5),
            durationTitle.heightAnchor.constraint(equalToConstant: durationTitle.font.lineHeight),
            durationTitle.leadingAnchor.constraint(equalTo: durationValue.leadingAnchor),
            durationTitle.trailingAnchor.constraint(equalTo: durationValue.trailingAnchor),
            
            distanceValue.topAnchor.constraint(equalTo: horizontalSeparator.centerYAnchor, constant: 55),
            distanceValue.heightAnchor.constraint(equalToConstant: distanceValue.font.lineHeight),
            distanceValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -self.view.bounds.width/4),
            
            distanceTitle.topAnchor.constraint(equalTo: distanceValue.bottomAnchor, constant: 2.5),
            distanceTitle.heightAnchor.constraint(equalToConstant: distanceTitle.font.lineHeight),
            distanceTitle.leadingAnchor.constraint(equalTo: distanceValue.leadingAnchor),
            distanceTitle.trailingAnchor.constraint(equalTo: distanceValue.trailingAnchor),
            
            caloryValue.topAnchor.constraint(equalTo: horizontalSeparator.centerYAnchor, constant: 55),
            caloryValue.heightAnchor.constraint(equalToConstant: caloryValue.font.lineHeight),
            caloryValue.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.bounds.width/4),
            
            caloryTitle.topAnchor.constraint(equalTo: caloryValue.bottomAnchor, constant: 2.5),
            caloryTitle.heightAnchor.constraint(equalToConstant: caloryTitle.font.lineHeight),
            caloryTitle.leadingAnchor.constraint(equalTo: caloryValue.leadingAnchor),
            caloryTitle.trailingAnchor.constraint(equalTo: caloryValue.trailingAnchor),
        ])
    }

}
