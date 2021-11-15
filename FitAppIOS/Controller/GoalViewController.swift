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
        button.addTarget(self, action: #selector(startActivity), for: .touchUpInside)
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
            
            buttonBackground.topAnchor.constraint(equalTo: trackerImage.bottomAnchor, constant: 50),
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
        
    }
}
