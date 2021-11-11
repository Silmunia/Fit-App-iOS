//
//  CalculatorViewController.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 10/11/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
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
            
            bmiProfile.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            bmiProfile.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7),
            bmiProfile.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
