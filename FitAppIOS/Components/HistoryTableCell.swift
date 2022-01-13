//
//  HistoryTableCell.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 10/11/21.
//

import UIKit

class HistoryTableCell: UITableViewCell {
    
    var cellDate: String?
    var cellDuration: Int?
    
    lazy var roundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let color = UIImage.imageWithColor(color: UIColor.init(named: "AccentColor")!)
        view.image = color
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        self.addSubview(view)
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = cellDate
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .darkGray
        self.addSubview(label)
        return label
    }()
    
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Duração: \(cellDuration ?? 0) min"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .darkGray
        self.addSubview(label)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellInfo(exerciseDate: String, exerciseDuration: Int) {
        cellDate = exerciseDate
        cellDuration = exerciseDuration
        configureLayout()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            roundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            roundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            roundImage.widthAnchor.constraint(equalToConstant: 50),
            roundImage.heightAnchor.constraint(equalToConstant: 50),
            
            dateLabel.topAnchor.constraint(equalTo: roundImage.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: roundImage.trailingAnchor, constant: 30),
            
            durationLabel.bottomAnchor.constraint(equalTo: roundImage.bottomAnchor),
            durationLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor)
        ])
    }
}
