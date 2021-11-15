//
//  CalculatorViewController.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 10/11/21.
//

import UIKit

class CalculatorViewController: UIViewController, UITextViewDelegate {
    
    lazy var userProfile: UserNameView = {
        let profile = UserNameView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profile)
        return profile
    }()
    
    lazy var bmiProfile: BMIView = {
        let profile = BMIView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profile)
        return profile
    }()
    
    lazy var weightTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Peso (kg)"
        self.view.addSubview(label)
        return label
    }()

    lazy var weightTextField: UITextView = {
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.delegate = self
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.font = UIFont.systemFont(ofSize: 24)
        field.text = "0"
        self.view.addSubview(field)
        return field
    }()
    
    lazy var heightTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Altura (cm)"
        self.view.addSubview(label)
        return label
    }()

    lazy var heightTextField: UITextView = {
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.delegate = self
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.font = UIFont.systemFont(ofSize: 24)
        field.text = "0"
        self.view.addSubview(field)
        return field
    }()
    
    lazy var buttonBackground: UIImageView = {
        let background = UIImageView()
        let viewColor = UIImage.imageWithColor(color: .systemBlue)
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
        label.text = "CALCULAR IMC"
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
            userProfile.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userProfile.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userProfile.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            userProfile.heightAnchor.constraint(equalToConstant: 80),
            
            weightTitle.topAnchor.constraint(equalTo: userProfile.bottomAnchor, constant: 50),
            weightTitle.leadingAnchor.constraint(equalTo: userProfile.leadingAnchor),
            weightTitle.trailingAnchor.constraint(equalTo: userProfile.trailingAnchor),
            
            weightTextField.topAnchor.constraint(equalTo: weightTitle.bottomAnchor, constant: 5),
            weightTextField.leadingAnchor.constraint(equalTo: weightTitle.leadingAnchor),
            weightTextField.trailingAnchor.constraint(equalTo: weightTitle.trailingAnchor),
            weightTextField.heightAnchor.constraint(equalToConstant: 40),
            
            heightTitle.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 20),
            heightTitle.leadingAnchor.constraint(equalTo: userProfile.leadingAnchor),
            heightTitle.trailingAnchor.constraint(equalTo: userProfile.trailingAnchor),
            
            heightTextField.topAnchor.constraint(equalTo: heightTitle.bottomAnchor, constant: 5),
            heightTextField.leadingAnchor.constraint(equalTo: heightTitle.leadingAnchor),
            heightTextField.trailingAnchor.constraint(equalTo: heightTitle.trailingAnchor),
            heightTextField.heightAnchor.constraint(equalTo: weightTextField.heightAnchor),
            
            buttonBackground.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 50),
            buttonBackground.bottomAnchor.constraint(equalTo: buttonBackground.topAnchor, constant: 80),
            buttonBackground.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonBackground.widthAnchor.constraint(equalTo: weightTextField.widthAnchor),

            buttonLabel.topAnchor.constraint(equalTo: buttonBackground.topAnchor),
            buttonLabel.leftAnchor.constraint(equalTo: buttonBackground.leftAnchor, constant: 6),
            buttonLabel.rightAnchor.constraint(equalTo: buttonBackground.rightAnchor, constant: -6),
            buttonLabel.bottomAnchor.constraint(equalTo: buttonBackground.bottomAnchor),

            button.topAnchor.constraint(equalTo: buttonBackground.topAnchor),
            button.bottomAnchor.constraint(equalTo: buttonBackground.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: buttonBackground.centerXAnchor),
            button.widthAnchor.constraint(equalTo: buttonBackground.widthAnchor),
            
            bmiProfile.topAnchor.constraint(equalTo: buttonBackground.bottomAnchor, constant: 100),
            bmiProfile.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7),
            bmiProfile.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
