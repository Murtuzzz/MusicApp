//
//  ButtonAmbient.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 04.06.2023.
//

import UIKit

final class LogInButton: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Log in with Apple ID"
        label.textColor = .white
        label.font = R.Fonts.nonItalic(with: 21)
        
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "apple.logo")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let buttonBody: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.background
        view.layer.cornerRadius = 30
        
        
        return view
    }()
    
    private let tapButton: UIButton = {
        let view = UIButton()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(buttonBody)
        addSubview(tapButton)
        addSubview(image)
        addSubview(label)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        buttonBody.translatesAutoresizingMaskIntoConstraints = false
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonBody.heightAnchor.constraint(equalToConstant: 60),
            buttonBody.widthAnchor.constraint(equalToConstant: 300),
            
            tapButton.heightAnchor.constraint(equalToConstant: 38),
            tapButton.widthAnchor.constraint(equalToConstant: 66),
            
            image.centerYAnchor.constraint(equalTo: buttonBody.centerYAnchor, constant: -1),
            image.leadingAnchor.constraint(equalTo: buttonBody.leadingAnchor, constant: 35),
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30),
            
            
            //label.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            
            label.topAnchor.constraint(equalTo: buttonBody.topAnchor, constant: 9),
            label.centerXAnchor.constraint(equalTo: buttonBody.centerXAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: buttonBody.centerYAnchor),
            

        
        ])
    }
}


