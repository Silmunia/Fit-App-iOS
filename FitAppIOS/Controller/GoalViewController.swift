//
//  GoalViewController.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 10/11/21.
//

import UIKit

class GoalViewController: UIViewController {
    
    lazy var trackerImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let trackerImage = UIImage(named: "MainScreenGoal")
        view.image = trackerImage
        self.view.addSubview(view)
        return view
    }()
    
    lazy var buttonBackground: UIImageView = {
        let background = UIImageView()
        let viewColor = UIImage.imageWithColor(color: UIColor(red: 0, green: 86/255, blue: 179/255, alpha: 1.0))
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = viewColor
        background.layer.cornerRadius = 40
        background.clipsToBounds = true
        background.layer.borderColor = .none
        self.view.addSubview(background)
        return background
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(startActivity), for: .touchUpInside)
        button.accessibilityLabel = "Começar atividade"
        self.view.addSubview(button)
        return button
    }()

    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let systemFont = UIFont.systemFont(ofSize: 48, weight: UIFont.Weight.regular)
        label.font = UIFont(descriptor: systemFont.fontDescriptor.withDesign(.rounded)!, size: 28)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "COMEÇAR"
        self.view.addSubview(label)
        return label
    }()
    
    lazy var stepImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "figure.walk")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = UIColor(red: 0, green: 86/255, blue: 179/255, alpha: 1.0)
        self.view.addSubview(view)
        return view
    }()
    
    lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 38, weight: .bold)
        label.textColor = .darkGray
        label.text = "5420"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var flameImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "flame.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = UIColor(red: 0, green: 86/255, blue: 179/255, alpha: 1.0)
        self.view.addSubview(view)
        return view
    }()
    
    lazy var flameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 38, weight: .bold)
        label.textColor = .darkGray
        label.text = "1002"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var connectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .darkGray
        label.text = "PULSEIRA CONECTADA"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureLayout()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            trackerImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            trackerImage.bottomAnchor.constraint(equalTo: trackerImage.topAnchor, constant: 310),
            trackerImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 5.5),
            trackerImage.widthAnchor.constraint(equalToConstant: 360),
            
            stepImage.topAnchor.constraint(equalTo: trackerImage.bottomAnchor, constant: 30),
            stepImage.heightAnchor.constraint(equalToConstant: 50),
            stepImage.widthAnchor.constraint(equalToConstant: 50),
            stepImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            stepLabel.centerYAnchor.constraint(equalTo: stepImage.centerYAnchor),
            stepLabel.heightAnchor.constraint(equalToConstant: stepLabel.font.lineHeight),
            stepLabel.leadingAnchor.constraint(equalTo: stepImage.trailingAnchor, constant: 5),
            
            flameLabel.centerYAnchor.constraint(equalTo: stepImage.centerYAnchor),
            flameLabel.heightAnchor.constraint(equalToConstant: flameLabel.font.lineHeight),
            flameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            flameImage.topAnchor.constraint(equalTo: stepImage.topAnchor),
            flameImage.heightAnchor.constraint(equalTo: stepImage.heightAnchor),
            flameImage.widthAnchor.constraint(equalTo: stepImage.widthAnchor),
            flameImage.trailingAnchor.constraint(equalTo: flameLabel.leadingAnchor, constant: -5),
            
            connectionLabel.topAnchor.constraint(equalTo: stepImage.bottomAnchor, constant: 80),
            connectionLabel.heightAnchor.constraint(equalToConstant: connectionLabel.font.lineHeight),
            connectionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            connectionLabel.widthAnchor.constraint(equalToConstant: 300),
            
            buttonBackground.topAnchor.constraint(equalTo: connectionLabel.bottomAnchor, constant: 50),
            buttonBackground.bottomAnchor.constraint(equalTo: buttonBackground.topAnchor, constant: 80),
            buttonBackground.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonBackground.widthAnchor.constraint(equalToConstant: 240),

            buttonLabel.topAnchor.constraint(equalTo: buttonBackground.topAnchor),
            buttonLabel.leftAnchor.constraint(equalTo: buttonBackground.leftAnchor, constant: 6),
            buttonLabel.rightAnchor.constraint(equalTo: buttonBackground.rightAnchor, constant: -6),
            buttonLabel.bottomAnchor.constraint(equalTo: buttonBackground.bottomAnchor),

            button.topAnchor.constraint(equalTo: buttonBackground.topAnchor),
            button.bottomAnchor.constraint(equalTo: buttonBackground.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: buttonBackground.centerXAnchor),
            button.widthAnchor.constraint(equalTo: buttonBackground.widthAnchor),
        ])
    }
    
    @objc func startActivity() {
        let activityController = ActivityViewController()
        activityController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(activityController, animated: true)
    }
}
