//
//  DataViewMultilabel.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 02/12/21.
//

import UIKit

class DataViewMultilabel: UIView {
    
    var titleSize: Int = 26
    var valueSize: Int = 42
    
    lazy var elementTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: CGFloat(titleSize), weight: .regular)
        label.textColor = .darkGray
        label.text = "Passos"
        label.textAlignment = .center
        label.isAccessibilityElement = false
        self.addSubview(label)
        return label
    }()
    
    lazy var elementValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: CGFloat(valueSize), weight: .bold)
        label.textColor = .darkGray
        label.text = "3789"
        label.textAlignment = .center
        label.isAccessibilityElement = false
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
    
    public func setLabels(titleString: String, valueString: String, acessibilityString: String) {
        elementTitle.text = titleString
        elementValue.text = valueString
        self.isAccessibilityElement = true
        self.accessibilityLabel = acessibilityString
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            elementValue.widthAnchor.constraint(equalTo: self.widthAnchor),
            elementValue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            elementValue.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -elementValue.font.lineHeight/3),
            
            elementTitle.centerXAnchor.constraint(equalTo: elementValue.centerXAnchor),
            elementTitle.widthAnchor.constraint(equalTo: elementValue.widthAnchor),
            elementTitle.topAnchor.constraint(equalTo: elementValue.bottomAnchor, constant: elementTitle.font.lineHeight/10)
        ])
    }
    
}
