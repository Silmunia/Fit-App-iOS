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
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var stepsElement: DataViewMultilabel = {
        let element = DataViewMultilabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setLabels(titleString: "Passos", valueString: "3789")
        self.view.addSubview(element)
        return element
    }()
        
    lazy var durationElement: DataViewMultilabel = {
        let element = DataViewMultilabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setLabels(titleString: "Duração", valueString: "32:15")
        self.view.addSubview(element)
        return element
    }()
    
    lazy var distanceElement: DataViewMultilabel = {
        let element = DataViewMultilabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setLabels(titleString: "Distância", valueString: "13.14 km")
        self.view.addSubview(element)
        return element
    }()

    lazy var calorieElement: DataViewMultilabel = {
        let element = DataViewMultilabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setLabels(titleString: "Calorias", valueString: "273 kCal")
        self.view.addSubview(element)
        return element
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
            
            stepsElement.topAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: 5),
            stepsElement.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            stepsElement.trailingAnchor.constraint(equalTo: horizontalSeparator.leadingAnchor, constant: -5),
            stepsElement.bottomAnchor.constraint(equalTo: verticalSeparator.topAnchor, constant: -5),
            
            durationElement.topAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: 5),
            durationElement.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            durationElement.leadingAnchor.constraint(equalTo: horizontalSeparator.trailingAnchor, constant: 5),
            durationElement.bottomAnchor.constraint(equalTo: verticalSeparator.topAnchor, constant: -5),
            
            distanceElement.topAnchor.constraint(equalTo: verticalSeparator.bottomAnchor, constant: 5),
            distanceElement.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            distanceElement.trailingAnchor.constraint(equalTo: horizontalSeparator.leadingAnchor, constant: -5),
            distanceElement.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            calorieElement.topAnchor.constraint(equalTo: verticalSeparator.bottomAnchor, constant: 5),
            calorieElement.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            calorieElement.leadingAnchor.constraint(equalTo: horizontalSeparator.trailingAnchor, constant: 5),
            calorieElement.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
        ])
        
    }
}
