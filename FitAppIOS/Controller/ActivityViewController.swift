//
//  ActivityViewController.swift
//  FitAppIOS
//
//  Created by Pedro Henrique on 15/11/21.
//

import UIKit

class ActivityViewController: UIViewController {
    
    var distanceValue: Float = 0
    var calorieCounter: Int = 0
    var timeCounter: [Int] = [0, 0, 0]
    
    var isRunning: Bool = false
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .darkGray
        label.text = "CORRIDA"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 88, weight: .bold)
        label.textColor = .darkGray
        label.text = String(format: "%.1f km", distanceValue)
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var calorieImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "flame.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .systemBlue
        self.view.addSubview(view)
        return view
    }()
    
    lazy var calorieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .darkGray
        label.text = "\(calorieCounter) kCal"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var timeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "clock.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .systemBlue
        self.view.addSubview(view)
        return view
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .darkGray
        label.text = String(format: "%02d:%02d:%02d", timeCounter[0], timeCounter[1], timeCounter[2])
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var heartImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "heart.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .systemBlue
        self.view.addSubview(view)
        return view
    }()
    
    lazy var heartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .darkGray
        label.text = "0 BPM"
        label.textAlignment = .center
        self.view.addSubview(label)
        return label
    }()
    
    lazy var playBackground: UIImageView = {
        let background = UIImageView()
        let viewColor = UIImage.imageWithColor(color: .systemBlue)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = viewColor
        background.layer.cornerRadius = 80
        background.clipsToBounds = true
        background.layer.borderColor = .none
        self.view.addSubview(background)
        return background
    }()
    
    lazy var playIcon: UIImageView = {
        let view = UIImageView()
        let icon = UIImage(systemName: "play.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = icon
        view.clipsToBounds = true
        view.tintColor = .white
        view.layer.borderColor = .none
        self.view.addSubview(view)
        return view
    }()

    lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(startRunning), for: .touchUpInside)
        self.view.addSubview(button)
        return button
    }()
    
    lazy var stopBackground: UIImageView = {
        let background = UIImageView()
        let viewColor = UIImage.imageWithColor(color: .systemBlue)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = viewColor
        background.layer.cornerRadius = 80
        background.clipsToBounds = true
        background.layer.borderColor = .none
        self.view.addSubview(background)
        return background
    }()
    
    lazy var stopIcon: UIImageView = {
        let view = UIImageView()
        let icon = UIImage(systemName: "stop.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = icon
        view.clipsToBounds = true
        view.tintColor = .white
        view.layer.borderColor = .none
        self.view.addSubview(view)
        return view
    }()

    lazy var stopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(stopRunning), for: .touchUpInside)
        self.view.addSubview(button)
        return button
    }()
    
    lazy var pauseBackground: UIImageView = {
        let background = UIImageView()
        let viewColor = UIImage.imageWithColor(color: .systemBlue)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.image = viewColor
        background.layer.cornerRadius = 80
        background.clipsToBounds = true
        background.layer.borderColor = .none
        self.view.addSubview(background)
        return background
    }()
    
    lazy var pauseIcon: UIImageView = {
        let view = UIImageView()
        let icon = UIImage(systemName: "pause.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = icon
        view.clipsToBounds = true
        view.tintColor = .white
        view.layer.borderColor = .none
        self.view.addSubview(view)
        return view
    }()

    lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(pauseRunning), for: .touchUpInside)
        self.view.addSubview(button)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
        updateActivityButtons()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.font.lineHeight),
            
            distanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 90),
            distanceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            distanceLabel.heightAnchor.constraint(equalToConstant: distanceLabel.font.lineHeight),
            
            calorieImage.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 50),
            calorieImage.widthAnchor.constraint(equalToConstant: 40),
            calorieImage.heightAnchor.constraint(equalTo: calorieImage.widthAnchor),
            calorieImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            calorieLabel.topAnchor.constraint(equalTo: calorieImage.bottomAnchor, constant: 10),
            calorieLabel.heightAnchor.constraint(equalToConstant: calorieLabel.font.lineHeight),
            calorieLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            calorieLabel.centerXAnchor.constraint(equalTo: calorieImage.centerXAnchor),
            
            timeImage.topAnchor.constraint(equalTo: calorieImage.topAnchor),
            timeImage.widthAnchor.constraint(equalTo: calorieImage.widthAnchor),
            timeImage.heightAnchor.constraint(equalTo: calorieImage.heightAnchor),
            timeImage.centerXAnchor.constraint(equalTo: calorieImage.centerXAnchor, constant: -self.view.bounds.width/3.2),
            
            timeLabel.topAnchor.constraint(equalTo: calorieLabel.topAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: timeLabel.font.lineHeight),
            timeLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            timeLabel.centerXAnchor.constraint(equalTo: timeImage.centerXAnchor),
            
            heartImage.topAnchor.constraint(equalTo: calorieImage.topAnchor),
            heartImage.widthAnchor.constraint(equalTo: calorieImage.widthAnchor),
            heartImage.heightAnchor.constraint(equalTo: calorieImage.heightAnchor),
            heartImage.centerXAnchor.constraint(equalTo: calorieImage.centerXAnchor, constant: self.view.bounds.width/3.2),
            
            heartLabel.topAnchor.constraint(equalTo: calorieLabel.topAnchor),
            heartLabel.heightAnchor.constraint(equalToConstant: heartLabel.font.lineHeight),
            heartLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3),
            heartLabel.centerXAnchor.constraint(equalTo: heartImage.centerXAnchor),
            
            playBackground.topAnchor.constraint(equalTo: calorieLabel.bottomAnchor, constant: 80),
            playBackground.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -self.view.bounds.width/4.5),
            playBackground.widthAnchor.constraint(equalToConstant: 160),
            playBackground.heightAnchor.constraint(equalTo: playBackground.widthAnchor),
            
            playIcon.centerXAnchor.constraint(equalTo: playBackground.centerXAnchor),
            playIcon.centerYAnchor.constraint(equalTo: playBackground.centerYAnchor),
            playIcon.widthAnchor.constraint(equalTo: playBackground.widthAnchor, multiplier: 0.5),
            playIcon.heightAnchor.constraint(equalTo: playIcon.widthAnchor),

            playButton.centerYAnchor.constraint(equalTo: playBackground.centerYAnchor),
            playButton.centerXAnchor.constraint(equalTo: playBackground.centerXAnchor),
            playButton.widthAnchor.constraint(equalTo: playBackground.widthAnchor),
            playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor),
            
            stopBackground.topAnchor.constraint(equalTo: calorieLabel.bottomAnchor, constant: 80),
            stopBackground.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.bounds.width/4.5),
            stopBackground.widthAnchor.constraint(equalToConstant: 160),
            stopBackground.heightAnchor.constraint(equalTo: stopBackground.widthAnchor),
            
            stopIcon.centerXAnchor.constraint(equalTo: stopBackground.centerXAnchor),
            stopIcon.centerYAnchor.constraint(equalTo: stopBackground.centerYAnchor),
            stopIcon.widthAnchor.constraint(equalTo: stopBackground.widthAnchor, multiplier: 0.5),
            stopIcon.heightAnchor.constraint(equalTo: stopIcon.widthAnchor),

            stopButton.centerYAnchor.constraint(equalTo: stopBackground.centerYAnchor),
            stopButton.centerXAnchor.constraint(equalTo: stopBackground.centerXAnchor),
            stopButton.widthAnchor.constraint(equalTo: stopBackground.widthAnchor),
            stopButton.heightAnchor.constraint(equalTo: stopButton.widthAnchor),
            
            pauseBackground.topAnchor.constraint(equalTo: calorieLabel.bottomAnchor, constant: 80),
            pauseBackground.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pauseBackground.widthAnchor.constraint(equalToConstant: 160),
            pauseBackground.heightAnchor.constraint(equalTo: pauseBackground.widthAnchor),
            
            pauseIcon.centerXAnchor.constraint(equalTo: pauseBackground.centerXAnchor),
            pauseIcon.centerYAnchor.constraint(equalTo: pauseBackground.centerYAnchor),
            pauseIcon.widthAnchor.constraint(equalTo: pauseBackground.widthAnchor, multiplier: 0.5),
            pauseIcon.heightAnchor.constraint(equalTo: pauseIcon.widthAnchor),

            pauseButton.centerYAnchor.constraint(equalTo: pauseBackground.centerYAnchor),
            pauseButton.centerXAnchor.constraint(equalTo: pauseBackground.centerXAnchor),
            pauseButton.widthAnchor.constraint(equalTo: pauseBackground.widthAnchor),
            pauseButton.heightAnchor.constraint(equalTo: pauseButton.widthAnchor),
            
        ])
    }
    
    private func updateActivityButtons() {
        if (isRunning) {
            playBackground.isHidden = true
            playIcon.isHidden = true
            playButton.isHidden = true
            
            stopBackground.isHidden = true
            stopIcon.isHidden = true
            stopButton.isHidden = true
            
            pauseBackground.isHidden = false
            pauseIcon.isHidden = false
            pauseButton.isHidden = false
        } else {
            playBackground.isHidden = false
            playIcon.isHidden = false
            playButton.isHidden = false
            
            stopBackground.isHidden = false
            stopIcon.isHidden = false
            stopButton.isHidden = false
            
            pauseBackground.isHidden = true
            pauseIcon.isHidden = true
            pauseButton.isHidden = true
        }
    }
    
    private func toggleIsRunning() {
        isRunning = !isRunning
        updateActivityButtons()
    }
    
    @objc func startRunning() {
        toggleIsRunning()
    }
    
    @objc func pauseRunning() {
        toggleIsRunning()
    }
    
    @objc func stopRunning() {
    }

}
