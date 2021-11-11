//
//  BMIView.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 10/11/21.
//

import UIKit

class BMIView: UIView {

    var bmiValue: Float = 24.21
    
    var bmiCategory: String = "Categoria"
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 96)
        label.textAlignment = .center
        label.text = "\(bmiValue)"
        self.addSubview(label)
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 38)
        label.textAlignment = .center
        label.text = bmiCategory
        self.addSubview(label)
        return label
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
            categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            valueLabel.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor),
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }

}
