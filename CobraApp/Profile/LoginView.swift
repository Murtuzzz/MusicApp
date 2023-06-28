//
//  LoginView.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 11.06.2023.
//


import UIKit

final class LoginView: UIView {
    
    private let button = LogInButton()
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = R.Colors.sep.cgColor
        view.backgroundColor = R.Colors.bar
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = R.Fonts.nonItalic(with: 21)
        label.text = "Authorisation"
      
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.inactive
        label.font = R.Fonts.nonItalic(with: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "In order to access the library of favorite packs of sounds, log in with Apple ID"
        label.numberOfLines = 2
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = R.Colors.background
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(container)
        addSubview(image)
        addSubview(title)
        addSubview(subtitle)
        addSubview(button)
        
        constraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 280),
            container.widthAnchor.constraint(equalToConstant: 350),
            
            image.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
//            image.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 50),
            image.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 70),
            image.heightAnchor.constraint(equalToConstant: 70),
            
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            title.heightAnchor.constraint(equalToConstant: 20),
            title.widthAnchor.constraint(equalToConstant: 130),
            title.centerXAnchor.constraint(equalTo: container.centerXAnchor),

            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 1),
            subtitle.heightAnchor.constraint(equalToConstant: 45),
            subtitle.widthAnchor.constraint(equalToConstant: 300),
            subtitle.centerXAnchor.constraint(equalTo: container.centerXAnchor),

            
            button.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 30),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        
        ])
    }
    
}

