//
//  ButtonKids.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 04.06.2023.
//

import UIKit

final class FavoriteButton: UIView {
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        return view
    }()
    
    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "Unfavorite"
        label.textColor = R.Colors.orange
        label.font = R.Fonts.Italic(with: 18)
        return label
    }()
    
    private let buttonImage: UIImageView = {
        let image = UIImageView()
        image.image = R.Images.star
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true

        return image
    }()
    
    private let buttonBody: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.bar
        view.layer.cornerRadius = 21
        
        return view
    }()
    
    private let tapButton: UIButton = {
        let view = UIButton()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stack.addArrangedSubview(buttonImage)
        stack.addArrangedSubview(buttonLabel)
        
        
        addSubview(buttonBody)
        addSubview(tapButton)
        addSubview(stack)
//        addSubview(buttonImage)
//        addSubview(buttonLabel)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        buttonBody.translatesAutoresizingMaskIntoConstraints = false
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonBody.heightAnchor.constraint(equalToConstant: 40),
            buttonBody.widthAnchor.constraint(equalToConstant: 170),
            
            tapButton.heightAnchor.constraint(equalToConstant: 40),
            tapButton.widthAnchor.constraint(equalToConstant: 170),
            
            stack.centerYAnchor.constraint(equalTo: buttonBody.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: buttonBody.centerXAnchor),
            
            
            
            
//            buttonImage.centerYAnchor.constraint(equalTo: buttonBody.centerYAnchor),
//            buttonImage.leadingAnchor.constraint(equalTo: buttonBody.leadingAnchor, constant: 15),
//
//            //label.centerYAnchor.constraint(equalTo: image.centerYAnchor),
//            buttonLabel.leadingAnchor.constraint(equalTo: buttonImage.trailingAnchor, constant: 5),
//            buttonLabel.topAnchor.constraint(equalTo: buttonBody.topAnchor, constant: 9)

        
        ])
    }
}
