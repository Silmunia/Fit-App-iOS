//
//  UserNameView.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 10/11/21.
//

import UIKit

class UserNameView: UIView {
    
    let name: String = "Alex Silva"
    let age: Int = 25

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = name
        label.font = UIFont.systemFont(ofSize: 28)
        self.addSubview(label)
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(age) anos"
        label.font = UIFont.systemFont(ofSize: 24)
        self.addSubview(label)
        return label
    }()
    
    lazy var roundBackground: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let color = UIImage.imageWithColor(color: .systemBlue)
        view.image = color
        view.layer.cornerRadius = 45
        view.layer.masksToBounds = true
        self.addSubview(view)
        return view
    }()
    
    lazy var roundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let icon = UIImage(systemName: "person.fill")
        view.image = icon
        view.tintColor = .white
        self.addSubview(view)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            roundBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            roundBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            roundBackground.widthAnchor.constraint(equalToConstant: 90),
            roundBackground.heightAnchor.constraint(equalToConstant: 90),
            
            roundImage.centerXAnchor.constraint(equalTo: roundBackground.centerXAnchor),
            roundImage.centerYAnchor.constraint(equalTo: roundBackground.centerYAnchor),
            roundImage.widthAnchor.constraint(equalTo: roundBackground.widthAnchor, multiplier: 0.7),
            roundImage.heightAnchor.constraint(equalTo: roundBackground.heightAnchor, multiplier: 0.7),
            
            nameLabel.topAnchor.constraint(equalTo: roundBackground.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: roundBackground.trailingAnchor, constant: 15),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
    
}
