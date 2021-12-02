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
        label.font = .systemFont(ofSize: 96, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = "\(bmiValue)"
        self.addSubview(label)
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .darkGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
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
            valueLabel.topAnchor.constraint(equalTo: self.topAnchor),
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor),
            categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            self.bottomAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
        ])
    }
    
    public func setValueLabel(with value: Float) {
        self.bmiValue = value
        updateBMICategory()
    }
    
    private func updateBMICategory() {
        let currentBMI: Float = bmiValue
        var newCategory: String = ""
        
        switch (currentBMI) {
        case 0..<16.5:
            newCategory = "Peso muito abaixo do normal"
        case 16.5..<18.5:
            newCategory = "Peso abaixo do normal"
        case 18.5..<25:
            newCategory = "Normal"
        case 25..<30:
            newCategory = "Pré-obesidade"
        case 30..<35:
            newCategory = "Obesidade Classe 1"
        case 35..<40:
            newCategory = "Obesidade Classe 2"
        default:
            newCategory = "Obesidade Classe 3"
        }
        
        self.bmiCategory = newCategory
        
        updateLabels()
    }
    
    private func updateLabels() {
        valueLabel.text = String(format: "%.2f", bmiValue)
        valueLabel.accessibilityLabel = "IMC de " + valueLabel.text!
        categoryLabel.text = bmiCategory
        categoryLabel.accessibilityLabel = "IMC classificado como " + categoryLabel.text!
    }

}
